-module(p15).
-export([replicate/2]).

% test
% p15:replicate([a,b,c], 3).
% [a,a,a,b,b,b,c,c,c]

replicate(L, C) ->
    L2 = replicate(L, C, C, []),
    p05:reverse(L2).

replicate([_|T], 0, N, Acc) ->
    replicate(T, N, N, Acc);

replicate([H|T], C, N, Acc) ->
    replicate([H | T], C - 1, N, [H | Acc]);

replicate([], _, _, Acc) ->
    Acc.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
replicate_test_() ->
    ?_assert(replicate([a,b,c], 3) =:= [a,a,a,b,b,b,c,c,c]).
-endif.
