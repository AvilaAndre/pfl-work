:-[utils].
%1

  %a

double(X, Y):- Y is X*2.

map(_, [], []).

map(Pred, [H1 | T1], [H2 | T2]):- 
    G =.. [Pred, H1, H2],
    G,
    map(Pred, T1, T2).