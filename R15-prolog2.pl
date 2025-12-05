% Exercício 1
alto_impacto(D) :-
    creditos(D, C),
    C > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% Consulta:
% ?- alto_impacto(X).


% Exercício 2
disciplina_matematica_sem_dependentes(D) :-
    area(D, matematica),
    creditos(D, 4),
    \+ prerequisito(_, D).

% Consulta:
% ?- disciplina_matematica_sem_dependentes(X).


% Exercício 3 - regra auxiliar
falta_concluir(Aluno, Disc) :-
    prerequisito(Disc, _),
    \+ concluiu(Aluno, Disc).

% Exercício 3 - regra principal
aluno_apto(Aluno, Disc) :-
    area(Disc, A),
    A \= fundamental,
    forall(
        prerequisito(Pre, Disc),
        concluiu(Aluno, Pre)
    ).

% Consultas:
% ?- aluno_apto(joao, X).
% ?- aluno_apto(maria, inteligencia_artificial).


% Exercício 4 - especialista
especialista_comp(Aluno) :-
    concluiu(Aluno, D1),
    concluiu(Aluno, D2),
    D1 \= D2,
    area(D1, computacao),
    area(D2, computacao).

% Exercício 4 - deficiência
deficiencia_mat(Aluno) :-
    \+ (
        concluiu(Aluno, D),
        area(D, matematica)
    ).

% Consulta:
% ?- especialista_comp(X), deficiencia_mat(X).


% Exercício 5 - disciplina raiz
disciplina_raiz(D) :-
    \+ prerequisito(_, D).

% Exercício 5 - disciplina folha
disciplina_folha(D) :-
    \+ prerequisito(D, _).

% Consulta:
% ?- disciplina_raiz(X), area(X, A), A \= aplicacoes.
