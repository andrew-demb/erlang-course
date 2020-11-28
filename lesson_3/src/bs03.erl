-module(bs03).
-export([split/2]).

% 1> BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.
% <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>
% 2> bs03:split(BinText, "-:-").
% [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]

% bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-").

split(Binary, Delimiter) ->
    S = length(Delimiter),

    split(Binary, Delimiter, S, [], []).

split(Binary, Delimiter, DelimiterSize, Acc, WordsAcc) when byte_size(Binary) >= DelimiterSize ->
    case binary:part(Binary, 0, DelimiterSize) =:= list_to_binary(Delimiter) of
        true -> 
            X = binary:part(Binary, DelimiterSize, byte_size(Binary) - DelimiterSize),
            split(X, Delimiter, DelimiterSize, [], append_word(Acc, WordsAcc));
        false -> 
            <<F/utf8, Rest/binary>> = Binary,
            split(Rest, Delimiter, DelimiterSize, [F | Acc], WordsAcc)
    end;

split(<<F/utf8, Rest/binary>>, Delimiter, DelimiterSize, Acc, WordsAcc) ->
    split(Rest, Delimiter, DelimiterSize, [F | Acc], WordsAcc);

split(<<>>, _, _, Acc, WordsAcc) ->
    lists:reverse(append_word(Acc, WordsAcc)).

append_word(String, WordsAcc) ->
    [list_to_binary(lists:reverse(String)) | WordsAcc].