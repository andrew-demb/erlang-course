-module(p14).
-export([duplicate/1]).

% test
% p14:duplicate([a,b,c,c,d]).
% [a,a,b,b,c,c,c,c,d,d]

duplicate(L) ->
    L2 = duplicate(L, []),
    p05:reverse(L2).

duplicate([H|T], Acc) ->
    duplicate(T, [H, H | Acc]);

duplicate([], Acc) ->
    Acc.
