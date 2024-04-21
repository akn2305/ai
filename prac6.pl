% Define initial state of jugs (0 liters each)
initial_state(0, 0).

% Define capacities of the jugs
jug_capacity(5). % Jug A can hold 5 liters
jug_capacity(3). % Jug B can hold 3 liters

% Define goal state (Jug A contains 4 liters)
goal_state((4, _)).

% Define actions to transfer water between jugs
% Fill jug A
action((A, B), (5, B)) :- jug_capacity(Capacity), B < Capacity.
% Fill jug B
action((A, B), (A, 3)) :- jug_capacity(Capacity), A < Capacity.
% Empty jug A
action((A, B), (0, B)) :- A > 0.
% Empty jug B
action((A, B), (A, 0)) :- B > 0.
% Pour water from jug A to jug B until B is full
action((A, B), (A1, B1)) :-
    jug_capacity(CapacityB),
    B < CapacityB,
    DeltaB is CapacityB - B,
    A >= DeltaB,
    A1 is A - DeltaB,
    B1 is CapacityB.
% Pour water from jug B to jug A until A is full
action((A, B), (A1, B1)) :-
    jug_capacity(CapacityA),
    A < CapacityA,
    DeltaA is CapacityA - A,
    B >= DeltaA,
    B1 is B - DeltaA,
    A1 is CapacityA.

% Define a predicate to check if a state is valid
valid_state((A, B)) :- jug_capacity(CapacityA), jug_capacity(CapacityB), A >= 0, A =< CapacityA, B >= 0, B =< CapacityB.

% Define a predicate to check if a state is not already visited
not_visited(State, Visited) :- \+ member(State, Visited).

% Define a predicate to perform depth-first search
depth_first_search(State, _, _, [State]) :- goal_state(State).
depth_first_search(State, MaxDepth, Visited, [State|Path]) :-
    MaxDepth > 0,
    action(State, NextState),
    valid_state(NextState),
    not_visited(NextState, Visited),
    NewDepth is MaxDepth - 1,
    depth_first_search(NextState, NewDepth, [State|Visited], Path).

% Define a predicate to solve the Water Jug problem
solve_water_jug(Steps) :-
    initial_state(InitialState),
    MaxDepth is 20, % Maximum depth for search
    depth_first_search(InitialState, MaxDepth, [], Steps).
