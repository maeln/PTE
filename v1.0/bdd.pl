init :-
	[dico],
	chargerdicoperso,
	write('Entrez la chaine à traduire :'), nl,
	read(X), atom_codes(S,X),
	reduireFosse(S,G),
	write(G).

reduireFosse(E, G) :- atomic_list_concat(F,' ', E), smstofre(F, G).

smstofre([], []).
smstofre([T|R], [X|Y]) :-
	frword(T,X), 
	smstofre(R,Y).

cdico('y') :- [dicopersorules].
cdico('n') :- write('DicoPerso not loaded.').

chargerdicoperso :-
	write('Charger DicoPerso ? [y/n]'),
	get_char(X),
	cdico(X).


