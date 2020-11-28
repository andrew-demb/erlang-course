-module(bs01).
-export([first_word/1]).

% test
% BinText = <<"Some text">>.
% bs01:first_word(BinText).
% <<"Some">>

first_word(X) ->
    first_word(X, <<>>).

first_word(<<" ", _Rest/binary>>, Acc) ->
    Acc;

first_word(<<X/utf8, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary,X/utf8>>);

first_word(<<"">>, Acc) ->
    Acc.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
first_word_test_() ->
    ?_assert(first_word(<<"Some text">>) =:= <<"Some">>).
-endif.
