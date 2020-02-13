listaSoldados([['john',15,1], ['ryan',10,2], ['peter',5,3]]).


elegir_Random(N2, N1):-
    repeat,
    random(1, 4, Aux),
    N1 \= Aux,
    N2 is Aux, !.



atacar(Lista, Soldado1, Soldado2, ListaOut):-
    random(1, 4, N1),
    nth1(N1, Lista, Soldado1),
    elegir_Random(N2, N1),
    nth1(N2, Lista, Soldado2, Restante),
    nth1(3, Soldado1, Atk),
    nth1(2, Soldado2, Vida),
    VidaAct is Vida-Atk,
    select(Vida, Soldado2, VidaAct, Soldado2Aux),
    nth1(N2, ListaOut, Soldado2Aux, Restante).

