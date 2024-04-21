s(s) --> [].
s(s(Left, Middle, Right)) --> [a], s(Left), [b].

generate_parse_tree(Tree, Sentence) :-
    phrase(s(Tree), Sentence).
