% phoneme\2
% phoneme(E,G).
% 	- E : Lettre ou ensemble de lettre.
%	- G : Equivalent en phonètique.

% Regexp pour le wikitionnary :
% ((?<=(\x27{3}))\w+)|((?<=\x7C).+(?=\x7C))
% ((?<=(\x27{3}))\w(?=\x27))|((?<=\x7C)[^\s]+(?=\x7C))
% sed s/\'\'\'/phoneme\(\'/ test1 

:- ensure_loaded(basepho), ensure_loaded(dicopron).

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

toString([],[]).
toString([T|Q],[H|C]) :-
	atom_codes(T,H),
	toString(Q,C).
	

traduirePhoneme(Mot,Trad) :-
	enPhonetique(Mot,Phon),
	toString(Phon, String),
	flatten(String, Liste),
	name(Ss,Liste),
	pron(Trad,Ss).