-module(p13).
-export([decode/1]).

% test
% p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

decode([{C,Symbol}|T]) ->
    [decode_symbol(C, Symbol, []) | decode(T)];

decode([]) ->
    [].

decode_symbol(0, Symbol, Tail) ->
    [Symbol|Tail];

decode_symbol(C, Symbol, Tail) ->
    decode_symbol(C-1, Symbol, [Symbol|Tail]).
