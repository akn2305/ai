sentence --> noun_phrase, verb_phrase.
noun_phrase --> determiner, noun.
verb_phrase --> verb, noun_phrase.

determiner --> [the].
determiner --> [a].
noun --> [man].
noun --> [woman].
verb --> [saw].

generate_parse_tree(Sentence, ParseTree) :-
    phrase(sentence, Sentence, ParseTree).

% Example usage:
% ?- generate_parse_tree([the, man, saw, a, woman], ParseTree).
