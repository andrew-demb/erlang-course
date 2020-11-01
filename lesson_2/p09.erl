-module(p09).
-export([pack/1]).

% test
% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

pack([H|T]) ->
    pack(T, [H]);

pack(X) ->
    X.

pack([H=H1|T], [H1|Tail]) ->
    pack(T, [H, H1|Tail]);

pack([H|T], Tail) ->
    [Tail | pack(T, [H])];

pack([], Tail) ->
    [Tail].
