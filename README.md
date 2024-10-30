# PC1_IA
Reglas del sistema de Tres en raya.
1. Para toda casilla, solo puede incluir un valor (jugador) a la vez.
2. Un jugador no puede efectuar 2 turnos seguidos
3. Al completarse todas las casillas, se marca como un empate.
4. Secuencia correcta: Uno de los jugadores hizo "tres en raya".
Modelo conceptual:
![IMG_0019](https://github.com/user-attachments/assets/fee9a013-a423-4e32-87eb-d92d6a5d42c9)

Para la situación correcta, se colocaron los siguiente comandos en consola.
iniciar_tablero(Tablero),
|    colocar_jugada(Tablero,1,x,[],Tablero1,Turnos1),
|    colocar_jugada(Tablero1,4,o,Turnos1,Tablero2,Turnos2),
|    colocar_jugada(Tablero2,2,x,Turnos2,Tablero3,Turnos3),
|    colocar_jugada(Tablero3,7,o,Turnos3,Tablero4,Turnos4),
|    colocar_jugada(Tablero4,3,x,Turnos4,Tablero5,Turnos5),
|    verificar_win(Tablero5,x).

El resultado fue el siguiente:
Tablero = [_, _A, _B, _C, _D, _E, _F, _G, _H],
Tablero1 = [x, _A, _B, _C, _D, _E, _F, _G, _H],
Turnos1 = [x],
Tablero2 = [x, _A, _B, o, _D, _E, _F, _G, _H],
Turnos2 = [x, o],
Tablero3 = [x, x, _B, o, _D, _E, _F, _G, _H],
Turnos3 = [x, o, x],
Tablero4 = [x, x, _B, o, _D, _E, o, _G, _H],
Turnos4 = [x, o, x, o],
Tablero5 = [x, x, x, o, _D, _E, o, _G, _H],
Turnos5 = [x, o, x, o, x] .
Mostrando que los turnos solo se han efectuado cuando se haya validado que los jugadores eran distintos.
