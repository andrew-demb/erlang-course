-module(p10).
-export([encode/1]).

% test
% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]

encode(L) ->
    L2 = encode(L, []),
    p05:reverse(L2).

encode([H|T], Acc) ->
    encode_symbol(T, 1, H, Acc);

encode([], Acc) ->
    Acc.

encode_symbol([_=Symbol|T], C, Symbol, Acc) ->
    encode_symbol(T, C+1, Symbol, Acc);

encode_symbol(X, C, Symbol, Acc) ->
    encode(X, [{C, Symbol} | Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
encode_test_() ->
    ?_assert(encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
-endif.
