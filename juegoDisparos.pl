listaSoldados([['john',15,1], ['ryan',10,2], ['peter',5,3]]).


elegir_Random(Max, Min, N2, N1):-
    repeat,
    random(Min, Max, Aux),
    N1 \= Aux,
    N2 is Aux, !.

juego(Lista):-
    listaSoldados(ListAux),
    turnos(ListAux, Lista).


turnos(ListaSoldados, Lista):-
    comprobarHp(ListaSoldados, Soldado),
    Soldado == 0,
    comprobarLista(ListaSoldados),
    length(ListaSoldados, Aux),
    Max is Aux+1,
    atacar(ListaSoldados, _, _, Max, 1, ListaAux),
    turnos(ListaAux, Lista),!.

turnos(ListaSoldados, Lista):-
    comprobarHp(ListaSoldados, Soldado),
    Soldado \= 0,
    select(Soldado, ListaSoldados, ListaSoldadosAux),
    comprobarLista(ListaSoldadosAux),
    length(ListaSoldadosAux, Aux),
    Max is Aux+1,
    atacar(ListaSoldadosAux, _, _, Max, 1, ListaAux),
    turnos(ListaAux, Lista), !.

turnos(Lista, Lista).

comprobarLista(Lista):-
    Lista=[ _ | Rest],
    \+Rest == [].

comprobarCaido(Soldado):-
    nth1(2, Soldado, Hp),
    Hp=<0.

comprobarHp(Lista, Caido):-
    Lista = [Soldado | _ ], 
    comprobarCaido(Soldado),
    Caido = Soldado, !.

comprobarHp(Lista, Caido):-
    Lista = [ _ | Res ], 
    comprobarHp(Res, Caido).

comprobarHp([], 0 ).

atacar(Lista , _ , _ , Max, Min, ListaOut):-
    random(Min, Max, N1),
    nth1(N1, Lista, Soldado1),
    elegir_Random(Max, Min, N2, N1),
    nth1(N2, Lista, Soldado2, Restante),
    nth1(3, Soldado1, Atk),
    nth1(2, Soldado2, Vida, Soldado2Act),
    VidaAct is Vida-Atk,
    nth1(2, Soldado2Aux, VidaAct, Soldado2Act),
    nth1(N2, ListaOut, Soldado2Aux, Restante).

atacar(Lista, _ , _ , Lista).
