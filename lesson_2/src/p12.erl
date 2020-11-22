-module(p12).
-export([decode_modified/1]).

% test
% p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

decode_modified(L) ->
    L2 = decode_modified(L, []),
    p05:reverse(L2).

decode_modified([{0,_}|T], Acc) ->
    decode_modified(T, Acc);

decode_modified([{C,Symbol}|T], Acc) ->
    decode_modified([{C-1,Symbol} | T], [Symbol | Acc]);

decode_modified([Symbol|T], Acc) ->
    decode_modified(T, [Symbol | Acc]);

decode_modified([], Acc) ->
    Acc.
