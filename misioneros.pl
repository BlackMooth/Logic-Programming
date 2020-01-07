%“Misioneros”: buscamos la manera más rápida para tres misioneros y tres caníbales de cruzar
%un río, disponiendo de una canoa que puede ser utilizada por 1 o 2 personas (misioneros o caníbales),
%pero siempre evitando que haya misioneros en minoría en cualquier orilla (por razones obvias).

camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
    unPaso( EstadoActual, EstSiguiente ),
    \+member(EstSiguiente,CaminoHastaAhora),
    camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).

solucionOptima:-
    nat(N), % Buscamos solución de "coste" 0; si no, de 1, etc.
    camino([3,3,0,0,true],[0,0,3,3,false],[[3,3,0,0,true]],C), 
	length(C,N),
    reverse(C, R),
    write(R), !.

nat(0).
nat(N) :- nat(N1), N is N1+1.

unPaso(E1,E2):- unPaso1(E1,E2), esCorrecte(E2).

esCorrecte([ML,CL,MR,CR, _]):- 
    ML >= 0, ML=<3, CL >= 0, CL=<3, 
    MR >= 0, MR=<3, CR >= 0, CR=<3, 
    noMengen(ML,CL), 
    noMengen(MR,CR),!.

% Verifiquem que el nombre de misioners sempre és >= nombre de canívals	
noMengen(0,_).
noMengen(M,C):- M>=C.

%%% Anada

% marxen 1 o 2 canívals
unPaso1([ML,CL,MR,CR,true], [ML,CLN,MR,CRN,false]) :-
    member(N,[1,2]),
    CLN is CL - N,
    CRN is CR + N.

% Marxen 1 o 2 missioners
unPaso1([ML,CL,MR,CR,true], [MLN,CL,MRN,CR,false]) :-
    member(N,[1,2]),
    MLN is ML - N,
    MRN is MR + N.
	
% Marxen 1 caníval i 1 missioner
unPaso1([ML,CL,MR,CR,true], [MLN,CLN,MRN,CRN,false]) :-
    MLN is ML - 1,
    CLN is CL - 1,
    MRN is MR + 1,
    CRN is CR + 1.
	
%%% Tornada

% Tornen 1 o 2 canívals
unPaso1([ML,CL,MR,CR,false], [ML,CLN,MR,CRN,true]) :-
    member(N,[1,2]),
    CRN is CR - N,
    CLN is CL + N.
	
% Tornen 1 o 2 missioners
unPaso1([ML,CL,MR,CR,false], [MLN,CL,MRN,CR,true]) :-
    member(N,[1,2]),
    MRN is MR - N,
    MLN is ML + N.
	
% Tornen 1 caníval i 1 missioner
unPaso1([ML,CL,MR,CR,false], [MLN,CLN,MRN,CRN,true]) :-
    MLN is ML + 1,
    CLN is CL + 1,
    MRN is MR - 1,
    CRN is CR - 1.
