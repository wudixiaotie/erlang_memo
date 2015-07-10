-module (m_ets).

-compile (export_all).

new () ->
    ets:new (test, [named_table, public]).


insert () ->
    ets:insert (test, {a, 1}),
    ets:insert (test, {b, 2}),
    List = ets:tab2list (test),
    io:format ("~p~n", [List]).


delete () ->
    ets:delete (test).


find (Key) ->
    ets:lookup (test, Key).

update (Key, Value) ->
    ets:update_element (test, Key, {2, Value}).