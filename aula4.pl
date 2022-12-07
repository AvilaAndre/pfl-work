:-dynamic male/1, female/1, parent/2.

%1


 %a

add_person:-
    write('Person\'s gender: '),
    read(Gender),
    Gender == male,
    write('Person\'s name: '),
    read(Name),
    \+male(Name),
    assert(male(Name)).

add_person:-
    write('Person\'s gender: '),
    read(Gender),
    Gender == male,
    write('Person\'s name: '),
    read(Name),
    \+female(Name),
    assert(female(Name)).

 %b

add_parents(Person):-
    write('Person\'s first parent name: '),
    read(Parent1),
    assert(parent(Parent1, Person)),
    write('Person\'s second parent name: '),
    read(Parent2),
    assert(parent(Parent2, Person)).

 %c

remove_person:-
    write('Person\'s name: '),
    read(Person),
    retract(female(Person));
    write(Person),
    retract(male(Person)).

% remove_person:-
%     write('Person\'s name: '),
%     read(Person),
%     retract(male(Person)).

% remove_person:-
%     write('Person\'s name: '),
%     read(Person),
%     parent(_, Person),
%     retractall(parent(_, Person)).

% remove_person:-
%     write('Person\'s name: '),
%     read(Person),
%     parent(Person, _),
%     retractall(parent(Person, _)).