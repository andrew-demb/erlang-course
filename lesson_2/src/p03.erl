-module(p03).
-export([element_at/2]).

% test
% p03:element_at([a,b,c,d,e,f], 4).
% d
% p03:element_at([a,b,c,d,e,f], 10).
% undefined

element_at([], _) ->
    undefined;

element_at([H|_], 0) ->
    H;

element_at([_|T], I) ->
    element_at(T, I-1).