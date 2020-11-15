-module(bs02).
-export([words/1]).

% test
% BinText = <<"Text with four words">>.
% bs02:words(BinText).
% [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]

words(Binary) ->
    words(Binary, <<>>, []).

words(<<" ", Rest/binary>>, Acc, WordsAcc) ->
    words(Rest, <<>>, [Acc | WordsAcc]);

words(<<X/utf8, Rest/binary>>, Acc, WordsAcc) ->
    words(Rest, <<Acc/binary, X/utf8>>, WordsAcc);

words(<<"">>, Acc, WordsAcc) ->
    lists:reverse([ Acc | WordsAcc]).
