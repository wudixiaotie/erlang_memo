-module (m_list).

-compile (export_all).

find (El, List) ->
    lists:member (El, List).


loop (N) ->
    F = fun (Index) ->
        io:format ("=============~p~n", [Index])
    end,
    lists:foreach (F, lists:seq (1, N)).

loop1 (N) ->
    case N > 0 of
        true ->
            Next = N - 1,
            io:format ("=============~p~n", [N]),
            loop1 (Next);
        false ->
            ok
    end.


% time cost
% loop:
% 1000:
% Range:20471 - 52954 mics
% Median:45721 mics 
% Average:42652 mics 
% 5000:
% Range:211489 - 271293 mics
% Median:237016 mics 
% Average:237902 mics
% 10000:
% Range:440530 - 459896 mics
% Median:455804 mics 
% Average:452860 mics 

% loop1:
% 1000:
% Range:30694 - 59698 mics
% Median:40175 mics 
% Average:44503 mics
% 5000:
% Range:210768 - 236906 mics
% Median:222496 mics 
% Average:224740 mics 
% 10000:
% Range:442116 - 474719 mics
% Median:449589 mics 
% Average:453244 mics