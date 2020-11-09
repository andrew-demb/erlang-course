-module(p08).
-export([compress/1]).

% test
% p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [a,b,c,a,d,e]

compress([]) ->
    [];

compress([H=H1,H1|T]) ->
    compress([H|T]);

compress([H|T]) ->
    [H|compress(T)].