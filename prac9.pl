%Frame for an object
object(car, [name:car, type:vehical, color:red, size:medium]).
object(wheel, [name:wheel, type:part, color:black, size:small]).
object(door, [name:door, type:part, color:red, size:medium]).
object(window, [name:window, type:part, color:transparent, size:small]).

%Relations between objects
relation(car, part_of, wheel).
relation(car, part_of, door).
relation(car, part_of, window).
