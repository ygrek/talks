type t = {
  x : int;
  y [@name "z"] : int;
} [@@generate]
