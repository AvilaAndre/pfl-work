%1
% a)
factorial(0, 1).
factorial(N, F):- N>0,
    N1 is N-1,
    factorial(N1, F1),
    F is F1 * N.
%b)
somaRec(0, 0).
somaRec(N, Sum):- N > 0,
    N1 is N-1,
    somaRec(N1, Sum1),
    Sum is Sum1+N.

%c)
fib(0, 0).
fib(1, 1).
fib(N, R) :- N > 1,
	A1 is N-1,
	A2 is N-2,
	fib(A1, R1),
	fib(A2, R2),
	R is R1 + R2.

%d)
isPrime(0) :- false.
isPrime(1) :- true.
isPrime(X) :- X > 2,
    and(true, isPrime(X-1)). % not working yet

test(A, B, C) :- C is (A rem B).

and(L,R) :- L,R.
or(L,R) :- L;R.

%5
 %a)
list_size([], 0).
list_size([_ListHead | ListTail], Size):-
    %Tail is ListTail,
    %Size1 is Size + 1,
    list_size(ListTail, Size1),
    Size is Size1 + 1.

 %b)

list_sum([], 0).
list_sum([ListHead | ListTail], Size):-
    %Tail is ListTail,
    %Size1 is Size + 1,
    list_sum(ListTail, Size1),
    Size is Size1 + ListHead.

 %c)

list_prod([], 1).
list_prod([ListHead | ListTail], Prod):-
    list_prod(ListTail, Prod1),
    Prod is ListHead * Prod1.