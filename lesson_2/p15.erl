-module(p15).
-export([replicate/2]).

% test
% p15:replicate([a,b,c], 3).
% [a,a,a,b,b,b,c,c,c]

% ToDo: how to avoid extra nesting?

replicate([H|T], C) ->
    [replicate_symbol(C, H, []) | replicate(T, C)];

replicate([], _) ->
    [].

replicate_symbol(0, _, Tail) ->
    Tail;

replicate_symbol(C, Symbol, Tail) ->
    replicate_symbol(C-1, Symbol, [Symbol|Tail]).
