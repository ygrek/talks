#define test(x) if x = 2 then

#if defined OCAML3
let (@@) f x = f x
#elif defined OCAML400
external (@@) : ('a -> 'b) -> 'a -> 'b = "%apply"
#endif

let () = print_endline @@ test(3) "wut?" else "ok!"
