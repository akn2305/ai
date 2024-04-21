% Define the game state and possible moves
initial_state([_,_,_,_,_,_,_,_,_]).
terminal_state(State) :-
    member(x, State); member(o, State); \+ member(_, State).

% Utility function to evaluate terminal states
utility(State, 1) :- winner(State, x).
utility(State, -1) :- winner(State, o).
utility(_, 0).

% Minimax algorithm
minimax(State, _, Value) :- terminal_state(State), utility(State, Value).
minimax(State, Player, Value) :-
    findall(NextState, valid_move(State, Player, NextState), NextStates),
    next_player(Player, Opponent),
    best_move(NextStates, Opponent, Value).

% Find the best move for the current player
best_move([State], _, Value) :- minimax(State, _, Value).
best_move([State|States], Opponent, Value) :-
    minimax(State, Opponent, Value1),
    best_move(States, Opponent, Value2),
    better_move(State, Value1, Value2, Value).

% Determine the better move based on player
better_move(State, Value1, Value2, Value1) :- max_value(State), Value1 > Value2.
better_move(State, Value1, Value2, Value2) :- min_value(State), Value1 < Value2.

% Determine whether to maximize or minimize
max_value(State) :- turn(State, x).
min_value(State) :- turn(State, o).

% Determine whose turn it is
turn(State, Player) :-
    count_symbols(State, x, XCount),
    count_symbols(State, o, OCount),
    (XCount =< OCount -> Player = x ; Player = o).

% Count occurrences of a symbol in a list
count_symbols(List, Symbol, Count) :-
    include(=(Symbol), List, Filtered),
    length(Filtered, Count).

% Define the winning conditions
winner(State, Symbol) :-
    member(Line, [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]),
    all_equal(Line, Symbol),
    member(Symbol, State).

% Check if all elements in a list are equal to a given symbol
all_equal([H|T], H) :- maplist(=(H), T).
