-module(fib).
-export([fib/1]).

fib(N) -> fib(1, 1, N).

fib(_, Curr, 1) -> Curr;
fib(_, Curr, 0) -> Curr;
fib(Prev, Curr, N) when N > 1 -> fib(Curr, Prev + Curr, N - 1).
