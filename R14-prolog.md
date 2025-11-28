% Exercício 1
divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    ( dominio(Deus, ceu)
    ; dominio(Deus, mar)
    ; dominio(Deus, submundo)
    ).

% Consulta:
% ?- divindade_olimpica(X).


% Exercício 2
deus_maior(Deus) :-
    local_principal(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.

% Consulta:
% ?- deus_maior(X).


% Exercício 3
irmaos_germanos(A, B) :-
    progenitor(P, A), progenitor(P, B),
    progenitor(M, A), progenitor(M, B),
    P \= M,
    A \= B.

% Consulta:
% ?- irmaos_germanos(X, zeus).


% Exercício 4
ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).

% Consulta:
% ?- ancestral(urano, X).
