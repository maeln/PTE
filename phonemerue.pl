% phoneme\2
% phoneme(E,G).
% 	- E : Lettre ou ensemble de lettre.
%	- G : Equivalent en phonètique.

% NOTE RAPPORT AU IA
% Comme un cerveau, elle ne peut rien inventer sans d'abord connaitre.
% On ne connais pas le français, on la appris.
% Les différents dictionnaire du programme son nécessaire et représente
% la "mémoire" de l'IA. Ce n'est pas tricher dans faire usage.
% Une IA n'est qu'une base de connaisance et de relation qu'il serait
% impossible de posséder pour un cerveau humain.
% on peut toutefois lui faire apprendre grâce à ses connaisances.

% Regexp pour le wikitionnary :
% ((?<=(\x27{3}))\w+)|((?<=\x7C).+(?=\x7C))
% ((?<=(\x27{3}))\w(?=\x27))|((?<=\x7C)[^\s]+(?=\x7C))
% sed s/\'\'\'/phoneme\(\'/ test1 

pholettre([],[]).
pholettre([T|Q],[H|R]) :-
	ensure_loaded(alphabet_pron),
	pron(T,H), pholettre(Q,R).
	
getPhon([],[]).
getPhon([T1,T2,T3|R],[H|Q]) :- phon([T1,T2,T3],H), getPhon(R,Q).
getPhon([T1,T2|R],[H|Q]) :- phon([T1,T2], H), getPhon(R,Q).
getPhon([T1|R],[H|Q]) :- phon([T1],H), getPhon(R,Q).
	
enPhonetique(Mot,Trad) :-
	atom_codes(Mot,Liste),
	getPhon(Liste,Trad).
