let fail fmt = Printf.ksprintf failwith fmt

(** announce response *)
let announce_response s exp_txn =
  let rec clients rest l =
    bitmatch rest with
    | { ip : 32 ; port : 16 ; rest : -1 : bitstring } -> clients rest ((ip,port)::l)
    | { } -> l
  in
  bitmatch Bitstring.bitstring_of_string s with
  | { 1l : 32 ; txn : 32 ; interval : 32 ; leechers : 32 ; seeders : 32 ;
      rest : -1 : bitstring } -> 
        if txn = exp_txn then 
          (interval,clients rest []) 
        else
          fail "error announce_response txn %ld expected %ld" txn exp_txn
  | { 3l : 32 ; txn : 32 ; msg : -1 : string } -> fail "error announce_response txn %ld : %s" txn msg
  | { } -> fail "error announce_response (expected txn %ld) : %S" exp_txn s
