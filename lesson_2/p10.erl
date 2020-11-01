-module(p10).
-export([encode/1]).

% test
% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]

encode([H|T]) ->
    encode_symbol(T, 1, H);

encode(X) ->
    X.

encode_symbol([_=Symbol|T], C, Symbol) ->
    encode_symbol(T, C+1, Symbol);

encode_symbol(X, C, Symbol) ->
    [{C, Symbol}|encode(X)].
