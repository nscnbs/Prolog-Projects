%zad 1

suma([], 0).
suma([H|T], Wynik) :-
	suma(T, Tmp),
	Wynik is H+Tmp.

srednia(X, Wynik) :-
	suma(X, Suma),
	length(X, L),
	Wynik is Suma / L.

wariancja(X, D) :-
	srednia(X, Srednia),
	length(X, Liczba),
	wariancja_tmp(X, Srednia, Liczba, D).

wariancja_tmp([], _, _, 0).
wariancja_tmp([H|T], Srednia, Liczba, D) :-
	wariancja_tmp(T, Srednia, Liczba, Tmp),
	D is ((Srednia - H)^2)/Liczba + Tmp.

%zad 2

max_sum([H|T], S) :-
	max_sum_tmp([H|T], 0, 0, S).

max_sum_tmp([], _, S, S).
max_sum_tmp([X|L], Old1, Old2, S) :-
	New1 is max(X, Old1+X),
	New2 is max(Old2, New1),
	max_sum_tmp(L, New1, New2, S).

%zad 3

even_permutation([], []).
even_permutation([X|T], Perm) :-
    even_permutation(T, Perm1),
    insert_odd(X, Perm1, Perm).
even_permutation([X|T], Perm) :-
    odd_permutation(T, Perm1),
    insert_even(X, Perm1, Perm).

odd_permutation([X|T], Perm) :-
    odd_permutation(T, Perm1),
    insert_odd(X, Perm1, Perm).
odd_permutation([X|T], Perm) :-
    even_permutation(T, Perm1),
    insert_even(X, Perm1, Perm).

insert_odd(X, InList, [X|InList]).
insert_odd(X, [Y,Z|InList], [Y,Z|OutList]) :-
    insert_odd(X, InList, OutList).

insert_even(X, [Y|InList], [Y,X|InList]).
insert_even(X, [Y,Z|InList], [Y,Z|OutList]) :-
    insert_even(X, InList, OutList).
