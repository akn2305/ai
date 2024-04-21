conc([],L,L).
conc([H|T1],L,[H|T2]):-
    conc(T1,L,T2).

reverse([],[]).
reverse([H|T],R):-
    reverse(T,R1),
    conc(R1,[H],R).

