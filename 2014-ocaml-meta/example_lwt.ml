let get_date () =
  let proc = Lwt_process.open_process ("",[|"date"|]) in
  lwt date = try_lwt Lwt_io.read_line proc#stdout with _ -> Lwt.return "unknown" in
  lwt _ = proc#close in
  Lwt.return date

let () =
  print_endline @@ Lwt_main.run @@ get_date ()
