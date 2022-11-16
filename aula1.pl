male(frank).
male(phil).
male(jay).
male(mitchell).
male(javier).
male(joe).
male(manny).
male(merle).
male(cameron).
male(bo).
male(calhoun).
male(luke).
male(rexford).
male(dylan).
male(george).
female(grace).
female(dede).
female(claire).
female(gloria).
female(barb).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

parent(grace, phil). parent(frank, phil).
parent(dede, claire). parent(dede, mitchell). parent(jay, claire). parent(jay, mitchell).
parent(jay, joe). parent(gloria, joe).
parent(gloria, manny). parent(javier, manny).
parent(barb, cameron). parent(barb, pameron). parent(merle, cameron). parent(merle, pameron).
parent(phil, haley). parent(phil, alex). parent(phil, luke). parent(claire, haley). parent(claire, alex). parent(claire, luke).
parent(mitchell, lily). parent(mitchell, rexford). parent(cameron, lily). parent(mitchell, rexford).
parent(pameron, calhoun). parent(bo, calhoun).
parent(dylan, george). parent(dylan, poppy). parent(haley, george). parent(haley, poppy).

grandparent(X, Y):-
    parent(X, Z),
    parent(Z, Y).

father(X, Y):-
    male(X),
    parent(X, Y).
