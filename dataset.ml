let exec cmd =
  Fmt.epr "exec %s\n %!" cmd;
  match Sys.command cmd with
  | 0 -> ()
  | n ->
     Fmt.failwith
       "Failed to set up the test environment: command `%s' exited with \
        non-zero exit code %d"
       cmd n

let prepare_trace file =
  let cmd = Filename.quote_command "tar" [ "-zxvf"; file ] in
  if Sys.file_exists file then exec cmd
  else (
    Fmt.failwith "File %s not found" file)

let get_stream () =
  let data_dir = List.hd Sites.Sites.data in
  Fmt.epr "data_dir = %s" data_dir;
  let log = Filename.concat data_dir "trace.tar.gz" in
  prepare_trace log;
  Yojson.Safe.stream_from_file "trace.json"
