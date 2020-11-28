-module(demo).
-export([double_num/1]).

% test
% c(demo).
% demo:double_num(5).
% 10

double_num(X) ->
  times(X, 2).

times(X, N) ->
  X * N.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
double_num_test_() ->
    ?_assert(double_num(5) =:= 10).
-endif.
