/*
Factorial
*/

factorial(0,1).

factorial(N,R) :-
    N1 is N-1,
    factorial(N1,R1),
    R is N * R1.

/*
Podemos definir operadores de manera infija

!(X,R) :- factorial(X,R).
?- op(150, )*/