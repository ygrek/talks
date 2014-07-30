open Ocamlbuild_plugin
;;

let dversion =
  if Sys.ocaml_version >= "4.01" then "OCAML401"
  else if Sys.ocaml_version >= "4.00" then "OCAML400"
  else "OCAML3"
;;

dispatch begin function
| After_rules ->
  flag ["ocaml"; "pp"; "dversion"] (S[A"cppo"; A "-D"; A dversion]);
  flag ["ocaml"; "compile"; "syntax_camlp4o"] (S[A"-syntax"; A"camlp4o"]);
  flag ["ocaml"; "ocamldep"; "syntax_camlp4o"] (S[A"-syntax"; A"camlp4o"]);
  flag ["ocaml"; "doc"; "syntax_camlp4o"] (S[A"-syntax"; A"camlp4o"]);
  ()
| _ -> ()
end
;;
