-module(p08).
-export([compress/1]).

% test
% p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [a,b,c,a,d,e]

compress([]) ->
    [];

compress(L) ->
    L2 = compress(L, []),
    p05:reverse(L2).

compress([H=H1,H1|T], Acc) ->
    compress([H|T], Acc);

compress([H|T], Acc) ->
    compress(T, [H|Acc]);

compress([], Acc) ->
    Acc.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
compress_test_() ->
    ?_assert(compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [a,b,c,a,d,e]).
-endif.
