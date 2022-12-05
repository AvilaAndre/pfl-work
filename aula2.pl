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

 %d)

inner_product([], [], 0).
inner_product([List1Head | List1Tail], [List2Head | List2Tail], Result):-
    inner_product(List1Tail, List2Tail, Result1),
    Result is List1Head * List2Head + Result1.

 %e)

count(_Elem, [], 0).
count(Elem, [ListHead | ListTail], N):-
    Elem \== ListHead,
    count(Elem, ListTail, N1),
    N is N1.

count(Elem, [ListHead | ListTail], N):-
    Elem == ListHead,
    count(Elem, ListTail, N1),
    N is N1 + 1.

%6

 %a

invert([], _List).
invert([List1Head | List1Tail], List2):-
    invert(List1Tail, List21),
    append(List21, [List1Head], List2).

 %b

del_one(_Elem, [], List2):-
    List2 = [].

del_one(Elem, [List1Head | List1Tail], List2):-
    Elem \== List1Head,
    del_one(Elem, List1Tail, List21),
    append([List1Head], List21, List2).

del_one(Elem, [List1Head | List1Tail], List2):-
    Elem == List1Head,
    List2 = List1Tail.

 %c

del_all(_Elem, [], List2):-
    List2 = [].

del_all(Elem, [List1Head | List1Tail], List2):-
    Elem \== List1Head,
    del_all(Elem, List1Tail, List21),
    append([List1Head], List21, List2).

del_all(Elem, [List1Head | List1Tail], List2):-
    Elem == List1Head,
    del_all(Elem, List1Tail, List2).

 %d

del_all_list([], List1, List2):-
    List1 = List2.

del_all_list([ListElemsHead | ListElemsTail], List1, List2):-
    del_all(ListElemsHead, List1, List21),
    del_all_list(ListElemsTail, List21, List2).

 %e

del_dups([], List2):-
    List2 = [].

del_dups([List1Head | List1Tail], List2):-
    del_all(List1Head, List1Tail, List21),
    del_dups(List21, List22),
    append([List1Head], List22, List2).