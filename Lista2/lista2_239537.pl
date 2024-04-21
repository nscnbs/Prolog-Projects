%zad 1

usun_tail(L,L1) :-
    append(L1, [_], L).
usun_head([_|L],L).

srodkowy([X],X).
srodkowy(L, X) :-
    usun_tail(L,L1),
    usun_head(L1,L2),
    srodkowy(L2,X).

%zad 2

jednokrotnie(X, L) :-
    select(X, L, L1),
    \+ member(X, L1).
dwukrotnie(X, L) :-
    select(X, L, L1),
    jednokrotnie(X, L1).

%zad 3

arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

search(A,B,V) :-
    arc(A,X),
    \+ member(X, V),
    (
        B = X;
        search(X,B,[X|V])
    ).


osiagalny(X,Y) :- X=Y.
osiagalny(X,Y) :- search(X,Y,[X]).

%zad 4

lista(N,L) :-
    numlist(1,N,A),
    odd_elts(L,A),
    permutation(A,B),
    even_elts(L,B).

odd_elts([],[]).
odd_elts([X,_|L], [X|R]) :-
    odd_elts(L,R).

even_elts([],[]).
even_elts([_,X|L], [X|R]) :-
    even_elts(L,R).
