-module(p11).
-export([encode_modified/1]).

% test
% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},b,{2,c},{2,a},d,{4,e}]

encode_modified(L) ->
    L2 = encode_modified(L, []),
    p05:reverse(L2).

encode_modified([H|T], Acc) ->
    encode_symbol(T, 1, H, Acc);

encode_modified([], Acc) ->
    Acc.

encode_symbol([_=Symbol|T], C, Symbol, Acc) ->
    encode_symbol(T, C+1, Symbol, Acc);

encode_symbol(X, 1, Symbol, Acc) ->
    encode_modified(X, [Symbol | Acc]);

encode_symbol(X, C, Symbol, Acc) ->
    encode_modified(X, [{C, Symbol} | Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
encode_modified_test_() ->
    ?_assert(encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},b,{2,c},{2,a},d,{4,e}]).
-endif.
