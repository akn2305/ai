/* Define frame properties */
property(color).
property(size).
property(material).

/* Define frames */
frame(apple, [color:red, size:small]).
frame(ball, [color:blue, size:medium, material:plastic]).
frame(book, [color:various, size:medium, material:paper]).
frame(car, [color:black, size:large, material:metal]).

/* Query to get information about a frame */
get_property(Frame, Property, Value) :-
    frame(Frame, Properties),
    member(Property:Value, Properties).
