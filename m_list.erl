-module (m_list).

-compile (export_all).

find (El, List) ->
    lists:member (El, List).