% Define the heuristic function for the A* search algorithm
heuristic(State, Heuristic) :-
    heuristic_values(Values),
    member(State-Heuristic, Values).

% Define the transition rules for the problem domain
transition(a, b, 1).
transition(b, c, 2).
transition(b, d, 3).
transition(c, goal, 4).
transition(d, goal, 5).

% Define the goal state for the problem domain
goal_state(goal).

% A* search algorithm
astar(Start, Path) :-
    astar([(0, Start, [])], [], Path).

% Base case: if the current state is the goal state, return the path
astar([(Cost, State, Path)|_], _, Path) :-
    goal_state(State).

astar([(Cost, State, Path)|Rest], Visited, FinalPath) :-
    findall((NewCost, NewState, [Move|Path]),
            (transition(State, NewState, Move),
             NewCost is Cost + Move,
             heuristic(NewState, Heuristic),
             NewCostHeuristic is NewCost + Heuristic,
             not(member(NewState, Visited)),
             \+ member((_, NewState, _), Rest),
             append(Rest, [(NewCostHeuristic, NewState, [Move|Path])],
             UpdatedQueue)),
    astar(UpdatedQueue, [State|Visited], FinalPath).

% Define the heuristic values for each state (example)
heuristic_values([a-5, b-4, c-3, d-2, goal-0]).

% Example usage:
% ?- astar(a, Path).


