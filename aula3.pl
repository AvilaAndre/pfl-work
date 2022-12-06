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