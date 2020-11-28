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

pack([_=H1|T], [H1|Tail], Acc) ->
    pack(T, [H1, H1|Tail], Acc);

pack([H|T], Tail, Acc) ->
    pack(T, [H], [Tail | Acc]);

pack([], Tail, Acc) ->
    [Tail | Acc].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
pack_test_() ->
    ?_assert(pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]).
-endif.
