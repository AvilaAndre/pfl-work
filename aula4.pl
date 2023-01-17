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
    Gender == female,
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
    (retract(female(Person));
    retract(male(Person))).

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


%2

%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

 %a

% matildes's answer
get_all_nodes(ListOfAirports):-
    setof(Origin, (Destination, Company, Code, Hour, Duration)^flight(Origin, Destination, Company, Code, Hour, Duration), L1),
    setof(Destination, (Origin, Company, Code, Hour, Duration)^flight(Origin, Destination, Company, Code, Hour, Duration), L2),
    append(L1, L2, L3),
    sort(L3, ListOfAirports).