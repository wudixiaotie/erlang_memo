-module (m_common).

-compile (export_all).

-define (FUN, fun () -> receive _ -> ok end end).

is_local () ->
    Pid = spawn (?FUN),
    erlang:node (Pid) == erlang:node ().


is_alive () ->
    Pid = spawn (?FUN),
    erlang:is_process_alive (Pid).