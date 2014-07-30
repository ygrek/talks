let get_date () =
  let proc = Lwt_process.open_process ("", [| "date" |]) in
  let __pa_lwt_0 =
    Lwt.catch (fun () -> Lwt_io.read_line proc#stdout)
      (fun _ -> Lwt.return "unknown")
  in
    Lwt.bind __pa_lwt_0
      (fun date ->
         let __pa_lwt_0 = proc#close
         in Lwt.bind __pa_lwt_0 (fun _ -> Lwt.return date))
  
let () = print_endline @@ (Lwt_main.run @@ (get_date ()))
  

