% Defining the grammar rules.
sentence(Tree) --> noun_phrase(NP), verb_phrase(VP), {Tree = [NP, VP]}.
noun_phrase(Tree) --> determiner(Det), noun(N), {Tree = np(Det, N)}.
verb_phrase(Tree) --> verb(V), noun_phrase(NP), {Tree = vp(V, NP)}.

% Lexical rules.
determiner(the) --> [the].
determiner(a) --> [a].
noun(cat) --> [cat].
noun(dog) --> [dog].
verb(chased) --> [chased].
verb(ate) --> [ate].

% Example query to generate a parse tree
% ?- phrase(sentence(Tree), [the, cat, chased, a, dog]).
