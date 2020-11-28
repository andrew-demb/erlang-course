-module(p02).
-export([but_last/1]).

% test
% p02:but_last([a,b,c,d,e,f]).
% [e,f]

but_last([H,H1|[]]) ->
    [H,H1];

but_last([_|T]) ->
    but_last(T);

but_last([]) ->
    [].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
but_last_test_() ->
    ?_assert(but_last([a,b,c,d,e,f]) =:= [e,f]).
-endif.
