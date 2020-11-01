-module(p12).
-export([decode_modified/1]).

% test
% p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

% ToDo: how to avoid extra nesting?

decode_modified([{C,Symbol}|T]) ->
    [decode_modified_symbol(C, Symbol, []) | decode_modified(T)];

decode_modified([Symbol|T]) ->
    [decode_modified_symbol(1, Symbol, []) | decode_modified(T)];

decode_modified([]) ->
    [].

decode_modified_symbol(0, _, Tail) ->
    Tail;

decode_modified_symbol(C, Symbol, Tail) ->
    decode_modified_symbol(C-1, Symbol, [Symbol|Tail]).
