
let gen_builder tdecl =
  let make_func body =
    let body =
      match find_attr_expr "inject" tdecl.ptype_attributes with
      | Some x when get_lid x = Some "unnamed" -> body
      | _ -> (* this type is represented as name-value pair *)
        let name = make_name tdecl.ptype_name.txt tdecl.ptype_attributes in
        let unwrapped_x = app (evar "named") [name; evar "x"] in
        let_in [Vb.mk (pvar "x") unwrapped_x] body
    in
    Str.value Nonrecursive [Vb.mk (pvar tdecl.ptype_name.txt) (lam (pvar "x") body)]
  in
  match has_attr "inject" tdecl.ptype_attributes, tdecl.ptype_kind, tdecl.ptype_manifest with
  | true, Ptype_record fields, _ ->
      let fields = List.map make_field fields in
      [make_func @@ let_in [Vb.mk (pvar "x") (app (evar "tuple") [evar "x"])] (record fields)]
  | true, Ptype_abstract, Some ty ->
      [make_func @@ app (extract ty tdecl.ptype_loc) [evar "x"]]
  | true, _, _ -> fatal tdecl.ptype_loc "Unsupported usage"
  | false, _, _ -> []
