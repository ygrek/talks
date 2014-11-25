(* Bad *)
let rec lines ch acc =
  try
    lines ch (input_line ch :: acc)
  with
    End_of_file -> List.rev acc
