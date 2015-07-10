-module (t_gen_event).

%% ===================================================================
%% gen_event
%% 
%% t_gen_event:start_link ().
%% t_gen_event:register ().
%% t_gen_event:send_event ({msg, <<"deeper">>}).
%% t_gen_event:send_event (aswdf).
%% t_gen_event:release ().
%% t_gen_event:stop ().
%% 
%% ===================================================================

-behaviour (gen_event).

-export ([start_link/0, register/0, send_event/1, release/0, stop/0]).

-export ([init/1, handle_event/2, handle_call/2, handle_info/2, terminate/2, code_change/3]).

start_link () ->
    gen_event:start_link ({local, event_manager}).

register () ->
    gen_event:add_handler (event_manager, ?MODULE, []).

send_event (Event) ->
    gen_event:notify (event_manager, Event).

release () ->
    gen_event:delete_handler (event_manager, ?MODULE, release).

stop () ->
    gen_event:stop (event_manager).

init ([]) ->
    {ok, []}.

handle_event (Event, State) ->
    io:format ("=============Event:~p, State:~p~n", [Event, State]),
    {ok, State}.

handle_call (_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

handle_info (_Info, State) -> {ok, State}.

terminate (Reason, _State) ->
    io:format ("=============Terminate Reason:~p~n", [Reason]),
    ok.

code_change (_OldVsn, State, _Extra) -> {ok, State}.