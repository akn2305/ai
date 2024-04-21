% Define the graph with its edges
edge(a, b, 2).
edge(a, c, 3).
edge(a, d, 5).
edge(b, e, 4).
edge(b, f, 7).
edge(c, g, 6).
edge(d, h, 3).

% Best-First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search_helper(Start, Goal, [Start], 0, Path).

% Base case: Goal reached
best_first_search_helper(Node, Node, _, _, [Node]).
best_first_search_helper(Current, Goal, Visited, TotalCost, [Current|Path]) :-
    edge(Current, Next, Cost),
    \+ member(Next, Visited), % Ensure we haven't visited this node yet
    NewCost is TotalCost + Cost,
    best_first_search_helper(Next, Goal, [Next|Visited], NewCost, Path).

% Predicate to find the path
path(Start, Goal, Path) :-
    best_first_search(Start, Goal, Path).
