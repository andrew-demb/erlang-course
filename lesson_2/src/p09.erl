-module(p09).
-export([pack/1]).

% test
% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

pack([H|T]) ->
    L2 = pack(T, [H], []),
    p05:reverse(L2);

pack([]) ->
    [].

pack([H=H1|T], [H1|Tail], Acc) ->
    pack(T, [H, H1|Tail], Acc);

pack([H|T], Tail, Acc) ->
    pack(T, [H], [Tail | Acc]);

pack([], Tail, Acc) ->
    [Tail | Acc].
