iniciar_tablero([_,_,_,_,_,_,_,_,_]).

ultimo([X],X).
ultimo([_| R], U):-
    ultimo(R, U ).
agregar_final([],J,[J]).
agregar_final([X|R],J,[X|Rp]):-
    agregar_final(R,J,Rp).
esTurno(_,[]):-
    !,true.
esTurno(Jugador, Lista):-
    ultimo(Lista, U),
    \+ Jugador = U , !.
modTurno(Lista,J,NLista):-
    esTurno(J, Lista),
    agregar_final(Lista, J , NLista).
actualizar_tablero([_|R], 1, J, [J|R]).
actualizar_tablero([X|R], Pos, J, [X|Resto]):-
    Pos > 1,
    Pos1 is Pos - 1,
    actualizar_tablero(R, Pos1, J, Resto).
colocar_jugada(Tablero, Pos, Jugador, Lturnos, TableroNuevo,TurnosNuevo):-
    modTurno(Lturnos,Jugador, TurnosNuevo),
    nth1(Pos, Tablero, Contenido),
    var(Contenido),
    actualizar_tablero(Tablero, Pos, Jugador, TableroNuevo).
verificar_win(Tablero, Jugador):-
    linea_ganadora([P1,P2,P3]),
    nth1(P1, Tablero, Jugador),
    nth1(P2, Tablero, Jugador),
    nth1(P3, Tablero, Jugador).

verificar_empate(Tablero):-
    \+ (member(X, Tablero), var(X)),
    \+ verificar_win(Tablero, x),
    \+ verificar_win(Tablero, o).
%hechos
linea_ganadora([1,2,3]).
linea_ganadora([4,5,6]).
linea_ganadora([7,8,9]).
linea_ganadora([1,4,7]).
linea_ganadora([2,5,8]).
linea_ganadora([3,6,9]).
linea_ganadora([1,5,9]).
linea_ganadora([3,5,7]).
