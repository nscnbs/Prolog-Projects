%zad1

ojciec(max, kamila).
ojciec(jan, ruslan).
ojciec(max, maria).
ojciec(tomek, max).
ojciec(robert, wiktoria).
matka(marta, kamila).
matka(wiktoria, ruslan).
matka(marta, maria).
mezczyzna(max).
mezczyzna(jan).
mezczyzna(ruslan).
mezczyzna(tomek).
mezczyzna(robert).
kobieta(kamila).
kobieta(maria).
kobieta(marta).
kobieta(wiktoria).
rodzic(max, kamila).
rodzic(marta, kamila).
rodzic(jan, ruslan).
rodzic(wiktoria, ruslan).
rodzic(max, maria).
rodzic(wiktoria, maria).

jest_matka(X):-
    kobieta(X),
    matka(X, Dziecko).

jest_ojcem(X):-
    mezczyzna(X),
    ojciec(X, Dziecko).

jest_synem(X):-
    mezczyzna(X),
    rodzic(Rodzic, X).

siostra(X, Y):-
    kobieta(X),
    matka(Rodzic, X),
    ojciec(Rodzic2, X),
    matka(Rodzic, Y),
    ojciec(Rodzic2, Y),
    X\=Y.

dziadek(X,Y):-
    mezczyzna(X),
    ojciec(X, Rodzic),
    rodzic(Rodzic, Y).

rodzenstwo(X,Y):-
    rodzic(X,Y);
    siostra(X,Y);
    dziadek(X,Y).

%zad2

on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).

above(X, Y) :-
    on(X, Y).
above(X, Z) :-
    on(X, Y),
    above(Y, Z).

%zad3

divide(X,Y):-
    N is Y*Y,
    N=<X,
    X mod Y =:=0,!.

divide(X,Y):-
    Y < X,
    Y1 is Y+1,
    divide(X,Y1).

isPrime(X):-
    (X > 1, \+ divide(X,2)).

prime(LO,HI,N):-
    between(LO,HI,N),
    isPrime(N).


