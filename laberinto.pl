laberinto([
    [1, 0, 1, 1],
    [1, 1, 0, 1],
    [0, 1, 1, 1],
    [1, 0, 1, 1]
]).


entrada(0, 0).
salida(3, 3).


mover(derecha, 0, 1).
mover(izquierda, 0, -1).
mover(arriba, -1, 0).
mover(abajo, 1, 0).


accesible(X, Y) :-
    laberinto(Maze),
    nth0(X, Maze, Row),
    nth0(Y, Row, 1).


camino(X, Y, _) :-
    salida(X, Y).

camino(X, Y, Visitadas) :-
    accesible(X, Y),
    \+ member((X, Y), Visitadas),
    mover(_, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    camino(NX, NY, [(X, Y)|Visitadas]).


solucionable :-
    entrada(X, Y),
    camino(X, Y, []).