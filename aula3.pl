%4

 %a

print_n(_S, 0).

print_n(S, N):-
    N1 is N - 1,
    print_n(S, N1),
    write(S).

 %b

print_word([]).

print_word([WordHead | WordTail]):-
    put_code(WordHead),
    print_word(WordTail).

print_text(Text, Symbol, Padding):-
    write(Symbol),
    print_n(' ', Padding),
    print_word(Text),
    print_n(' ', Padding),
    write(Symbol).

 %c

listSize([], 0).

listSize([_ListHead | ListTail], Size):-
    listSize(ListTail, Size1),
    Size is Size1 + 1.

print_banner(Text, Symbol, Padding):-
    listSize(Text, TextWidth),
    Width is TextWidth + Padding + Padding,
    write(Symbol),
    print_n(Symbol, Width),
    write(Symbol),
    write('\n'),
    write(Symbol),
    print_n(' ', Width),
    write(Symbol),
    write('\n'),
    print_text(Text, Symbol, Padding),
    write('\n'),
    write(Symbol),
    print_n(' ', Width),
    write(Symbol),
    write('\n'),
    write(Symbol),
    print_n(Symbol, Width),
    write(Symbol).