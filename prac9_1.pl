% Frame for a person
person(john, [name:john, age:40, gender:male, occupation:engineer]).
person(lisa, [name:lisa, age:35, gender:female, occupation:doctor]).
person(tom, [name:tom, age:10, gender:male, occupation:student]).

% Relations between people
spouse_of(john, lisa).
parent_of(john, tom).
parent_of(lisa, tom).
