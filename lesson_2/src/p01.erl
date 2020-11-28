-module(p01).
-export([last/1]).

% test
% p01:last([a,b,c,d,e,f]).
% f

last([H|[]]) ->
    H;

last([_|T]) ->
  last(T).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
last_test_() ->
    ?_assert(last([a,b,c,d,e,f]) =:= f).
-endif.
