%1

 %a

add_person/o(Gender, Name):-
    Gender == male,
    assert(male(Name)).

add_person/o(Gender, Name):-
    Gender == female,
    assert(male(Name)).

