-module(p14).
-export([duplicate/1]).

% test
% p14:duplicate([a,b,c,c,d]).
% [a,a,b,b,c,c,c,c,d,d]

duplicate([H|T]) ->
    duplicate(H, T);

duplicate([]) ->
    [].

duplicate(X, Y) ->
    [X,X|duplicate(Y)].
