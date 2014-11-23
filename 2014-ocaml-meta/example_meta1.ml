let square x = x * x

let rec power n x =
  if n = 0 then 1
  else if n mod 2 = 0 then square (power (n/2) x)
  else x * (power (n-1) x)
(* val power : int -> int -> int = <fun> *)

let rec spower n x =
  if n = 0 then .<1>.
  else if n mod 2 = 0 then .<square .~(spower (n/2) x)>.
  else .<.~x * .~(spower (n-1) x)>.
(* val spower : int -> int code -> int code = <fun> *)

let spower7_code = .<fun x -> .~(spower 7 .<x>.)>.
(* val spower7_code : (int -> int) code = .<
  fun x_1  ->
      x_1 *
            (((* cross-stage persistent value (id: square) *))
                     (x_1 * (((* cross-stage persistent value (id: square) *)) (x_1 * 1))))>. *)

let spower7 = Runcode.run spower7_code
