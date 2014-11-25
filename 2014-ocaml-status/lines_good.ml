(* Good *)
let rec lines ch acc =
  match input_line ch with
  | s -> lines ch (s::acc)
  | exception End_of_file -> List.rev acc
