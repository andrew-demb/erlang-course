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
