%HELPERS

print_stream([]).

print_stream([WordHead | WordTail]):-
    put_code(WordHead),
    print_stream(WordTail).

%1

 %a

add_person/o(Gender, Name):-
    Gender == male,
    male(Name),
    write('Already exists').

add_person/o(Gender, Name):-
    Gender == male,
    assert(male(Name)).

add_person/o(Gender, Name):-
    Gender == female,
    female(Name),
    write('Already exists').

add_person/o(Gender, Name):-
    Gender == female,
    assert(female(Name)).

 %b

add_parents(Person):-
    write('Person\'s first parent name: '),
    read(Parent1),
    assert(parent(Parent1, Person)),
    write('Person\'s second parent name: '),
    read(Parent2),
    assert(parent(Parent2, Person)).