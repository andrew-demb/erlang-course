-module(p06).
-export([is_palindrome/1]).

% test
% p06:is_palindrome([1,2,3,2,1]).
% true

is_palindrome(L) ->
    L =:= p05:reverse(L).
