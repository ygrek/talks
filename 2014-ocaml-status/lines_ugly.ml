(* Ugly *)
let rec lines ch acc =
  match try Some (input_line ch) with End_of_file -> None with
  | None -> List.rev acc
  | Some s -> lines ch (s::acc)
