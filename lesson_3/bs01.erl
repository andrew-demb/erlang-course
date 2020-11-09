-module(bs01).
-export([first_word/1]).

% test
% BinText = <<"Some text">>.
% <<"Some Text">>
% bs01:first_word(BinText).

first_word(X) ->
    first_word(X, <<>>).

first_word(<<" ", _Rest/binary>>, Acc) ->
    Acc;

first_word(<<X/utf8, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary,X/utf8>>);

first_word(<<"">>, Acc) ->
    Acc.
