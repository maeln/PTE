:- nl, write('Chargement de la base de connaissance personnel ...'), [basemotperso], write(' Fait !'), nl.
%
% Les règles étant lues de haut en bas, toute règles qui ne doit pas être prioritaire à ce qui est au dessus doit être inscrit
% Ci dessous.
% 

% Specifie qu'on ne souhaite pas réecrire totalement la règle dicoperso/2, mais qu'on l'ajoute juste
% à la base de connaisance actuelle ( celle de basemotperso.pl ).
:- multifile dicoperso/2. 
dicoperso(E , G) :-
	write('Le mot SMS : '), write(E), write(' n\'a pas été trouvé dans vos dictionnaire.'), nl,
	write('Merci d\'entrer sa signification afin de le rajouter au dictionnaire personnel et de compléter la traduction : '), nl,
	read(X), ajouterDicoPerso(E,X), [dictionnaireperso], dicoperso(E, G).
