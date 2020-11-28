-module(p05).
-export([reverse/1]).

% test
% p05:reverse([1,2,3]).
% [3,2,1]

reverse([]) ->
    [];

reverse([H|[]]) ->
    [H];

reverse([H|T]) ->
    reverse(T, [H]).

reverse([], Reversed) ->
    Reversed;

reverse([H|T], Reversed) ->
    reverse(T, [H | Reversed]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
reverse_test_() ->
    ?_assert(reverse([1,2,3]) =:= [3,2,1]).
-endif.
