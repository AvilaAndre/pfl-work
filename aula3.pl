%4

 %a

print_n(_S, 0).

print_n(S, N):-
    N1 is N - 1,
    print_n(S, N1),
    write(S).
