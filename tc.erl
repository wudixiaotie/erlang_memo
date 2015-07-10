-module (tc).

-export ([tc/4]).

tc(M, F, A, N) when N > 0 ->
    L = test_loop(M, F, A, N, []),
    Len = length(L),
    LSorted = lists:sort(L),
    Min = lists:nth(1, LSorted),
    Max = lists:nth(Len, LSorted),
    Med = lists:nth(round(Len/2), LSorted),
    Avg = round(lists:foldl(fun(X, Sum) ->
                    X + Sum end,
                0,
                LSorted)/Len),
    io:format("Range:~b - ~b mics~n"
          "Median:~b mics ~n"
          "Average:~b mics ~n",
          [Min, Max, Med, Avg]),
    Med.
  
test_loop(_M, _F, _A, 0, List) ->
    List;
test_loop(M, F, A, N, List) ->
    {T, _R} = timer:tc(M, F, A),
    test_loop(M, F, A, N-1, [T|List]).