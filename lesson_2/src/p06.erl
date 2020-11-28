-module(p06).
-export([is_palindrome/1]).

% test
% p06:is_palindrome([1,2,3,2,1]).
% true

is_palindrome(L) ->
    L =:= p05:reverse(L).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
is_palindrome_test_() ->
    ?_assert(is_palindrome([1,2,3,2,1]) =:= true).
-endif.
