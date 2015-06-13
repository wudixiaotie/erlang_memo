-module (m_common).

-compile (export_all).

is_local () ->
    F = fun () ->
        receive
            _ -> ok
        end
    end,
    Pid = spawn (F),
    node (Pid) == node ().