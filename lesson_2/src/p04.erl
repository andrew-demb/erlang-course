-module(p04).
-export([len/1]).

% test
% p04:len([]).
% 0
% p04:len([a,b,c,d]).
% 4

len(T) ->
    len(T, 0).

len([], I) ->
    I;

len([_|T], I) ->
    len(T, I+1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
len_test_() -> [
    ?_assert(len([]) =:= 0),
    ?_assert(len([a,b,c,d]) =:= 4)].
-endif.
