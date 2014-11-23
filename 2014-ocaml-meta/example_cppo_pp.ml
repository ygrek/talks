
external (@@) : ('a -> 'b) -> 'a -> 'b = "%apply"

let () = print_endline @@  if 3 = 2 then  "wut?" else "ok!"
