-module(fib).
-export([fib/1]).

fib(N) -> fib(1, 1, N).

fib(_, Curr, 1) -> Curr;
fib(_, Curr, 0) -> Curr;
fib(Prev, Curr, N) when N > 1 -> fib(Curr, Prev + Curr, N - 1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
fib_test_() -> [
    ?_assert(fib(0) =:= 1),
    ?_assert(fib(1) =:= 1),
    ?_assert(fib(2) =:= 2),
    ?_assert(fib(3) =:= 3),
    ?_assert(fib(4) =:= 5),
    ?_assert(fib(5) =:= 8),
    ?_assertException(error, function_clause, fib(-1)),
    ?_assert(fib(31) =:= 2178309)].
-endif.
