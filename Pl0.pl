% Autor:
% Fecha: 30/01/2020


%personas
personas([michael, santino, lucy, vito, vmadre, antonio, carmella, anonimo]).
relaciones([padre, madre]).

%Padre
padre(vito, antonio).
padre(santino, vito).
padre(michael, vito).
padre(lucy, santino).
padre(frederico, vito).
padre(deana, frederico).
padre(apollonia, michael).
padre(kay, michael).
padre(vincent, santino).
padre(sandra, santino).

%Madre
madre(vito, vmadre).
madre(santino, carmella).
madre(michael, carmella).
madre(lucy, anonimo).
madre(frederico, carmella).
madre(apollonia, anonimo).
madre(kay, anonimo).
madre(anthony, kay).
madre(mary, kay).
madre(carlo, constanzia).

%Reglas
progenitor(X, Y):-
    padre(X, Y); madre(X, Y).

ancestros(X, Y):- progenitor(X, Y).
ancestros(X, Y):-
    progenitor(X, Z),
    ancestros(Z, Y).
            


descendienteD(X, ListaD, Lista):-
    progenitor(Y, X),
    \+ member(Y, ListaD),
    append([Y], ListaD, ListaAux),
    descendienteD(X, ListaAux, Lista).

descendienteD(_, Lista, Lista).

descendiente(Padre, ListaD):-
    listaDes(Padre, [], ListaD). 

listaDes(Padre, ListaAux, ListaD):-
    progenitor(Otro, Padre),
    descendienteD(Padre, [], Lista),
    append(Lista, ListaAux, ListaAux2),
    listaDes(Otro, ListaAux2, ListaD).

listaDes(_, Lista, Lista).


relacion(X, Y, Relacion):-
    call(Relacion, X, Y),
    (Relacion == padre; Relacion == madre).
