-module(p11).
-export([encode_modified/1]).

% test
% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},b,{2,c},{2,a},d,{4,e}]

encode_modified([H|T]) ->
    encode_symbol(T, 1, H);

encode_modified(X) ->
    X.

encode_symbol([_=Symbol|T], C, Symbol) ->
    encode_symbol(T, C+1, Symbol);

encode_symbol(X, 1, Symbol) ->
    [Symbol|encode_modified(X)];

encode_symbol(X, C, Symbol) ->
    [{C, Symbol}|encode_modified(X)].
