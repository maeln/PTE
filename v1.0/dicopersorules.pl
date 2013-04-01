frword(E,E) :- frwordperso(E,E). % On redefini frword de manière à ce que, si un mot n'est pas trouvé dans frword, il va le chercher dans le dico perso.

addtodico(A,B) :- % Ajoute le mot A et son equivalent B dans le fichier DicoPerso.
	open('dicoperso.pl', append, DicoPerso),
	write(DicoPerso, 'frwordperso('),
	write(DicoPerso, A),
	write(DicoPerso, ',\''),
	write(DicoPerso, B),
	write(DicoPerso, '\').'),
	close(DicoPerso).
	
:- [dicoperso]. % Charge le dictionnaire personnel.

frwordperso(E,E). % Pour éviter que le programme abandonne une traduction car le mot n'est dans aucun dictionnaire, on fait que chaque mot est son propre équivalent.
