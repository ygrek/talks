module Deriving (Syntax : Camlp4.Sig.Camlp4Syntax) =
struct
  open Camlp4.PreCast
  include Syntax

  DELETE_RULE Gram str_item: "type"; type_declaration END
  DELETE_RULE Gram sig_item: "type"; type_declaration END

  open Ast

  EXTEND Gram
  str_item:
  [[ "type"; types = type_declaration -> <:str_item< type $types$ >>
    | "type"; types = type_declaration; "deriving"; "("; cl = LIST0 [x = UIDENT -> x] SEP ","; ")" ->
        let decls = display_errors loc Type.Translate.decls types in 
        let module U = Type.Untranslate(struct let loc = loc end) in
        let tdecls = List.map U.decl decls in
          <:str_item< type $list:tdecls$; $list:List.map (derive_str loc decls) cl$ >>
   ]]
  ;

end

module M = Camlp4.Register.OCamlSyntaxExtension(Id)(Deriving)

