-module(p07).
-export([flatten/1]).

% test
% p07:flatten([a,[],[b,[c,d],e]]).
% [a,b,c,d,e]

flatten(L) ->
    L2 = flatten(L, []),
    p05:reverse(L2).

flatten([[]|T], Acc) ->
    flatten(T, Acc);

flatten([[_|_]=H|T], Acc) ->
    flatten(T, flatten(H, Acc));

flatten([H|T], Acc) ->
    flatten(T, [H|Acc]);

flatten([], Acc) ->
    Acc;

flatten(H, Acc) ->
    [H | Acc].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
flatten_test_() ->
    ?_assert(flatten([a,[],[b,[c,d],e]]) =:= [a,b,c,d,e]).
-endif.
