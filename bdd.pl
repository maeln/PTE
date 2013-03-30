reduireFosse(E, G) :- atomic_list_concat(F,' ', E), smstofre(F, G).

:-[dico].

smstofre([], []).
smstofre([T|R], [X|Y]) :- frword(T,X), smstofre(R,Y).

