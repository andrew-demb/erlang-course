-module(p13).
-export([decode/1]).

% test
% p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

decode(L) ->
    L2 = decode(L, []),
    p05:reverse(L2).

decode([{0,_}|T], Acc) ->
    decode(T, Acc);

decode([{C,Symbol}|T], Acc) ->
    decode([{C-1,Symbol} | T], [Symbol | Acc]);

decode([], Acc) ->
    Acc.
