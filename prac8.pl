% Family Relationships
parent(john, jane).
parent(jane, jacob).
parent(jane, jenny).
parent(john, jack).


male(john).
male(jacob).
male(jack).
female(jane).
female(jenny).

% Predicates for relationship
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.
