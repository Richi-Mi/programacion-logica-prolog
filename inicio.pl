% Hechos
padre(juan, maria).
padre(juan, carlos).
madre(ana, maria).
madre(ana, carlos).

% Regla
hermano(X, Y) :- padre(P, X), padre(P, Y), madre(M, X), madre(M, Y), X \= Y.

% Consulta
?- hermano(maria, carlos).