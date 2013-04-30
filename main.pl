% Initialisation.
:- 
	write('Bienvenue dans le traducteur Français -> Sms.'),nl,
	write('Chargement du dictionnaire : '), [dico], nl,
	write('Chargement des phonèmes : '), [phonemes], nl,
	write('Chargement des prononciations : '), [pron],nl,
	write('Le programme est prêt à traduire.'),nl,
	write('Utilisez la règles traduire/2 afin d\'obtenir toute les traductions possibles'),nl.
	
% Cette fonction transforme une chaine en liste d'atom qui vont être nos "mots".
% Nous choisissons de les découper à chaque espace du à l'Axiome n°1.
% Il nous reste à réaliser la suppressions des ponctiations.
chaineVersAtom(Chaine, ListeAtom) :-
	atomic_list_concat(ListeAtom, ' ', Chaine).
	
% smsVersFR applique les correspondances présentes dans les dictionnaires de manière recursive, mot-à-mot.
% smsVersFR/2
% smsVersFR(X,Y). X = <LISTE MOT SMS>, Y = <LISTE MOT FRANÇAIS>
smsVersFr([],[]).
smsVersFr( [Tete|Queue], [Tres|Qres]) :-
	dico(Tete,Tres), smsVersFr(Queue,Qres).

% Renvoi les diffèrentes formes phonètiques possible d'un mot.
% getPhon/2
% getPhon(X,Y). X = <MOT ASCII>, Y = <LISTE PHONEMES>
getPhon([],[]).
getPhon([T1,T2,T3|R],[H|Q]) :- phon([T1,T2,T3],H), getPhon(R,Q).
getPhon([T1,T2|R],[H|Q]) :- phon([T1,T2], H), getPhon(R,Q).
getPhon([T1|R],[H|Q]) :- phon([T1],H), getPhon(R,Q).

% Traduit un mot en phonètique.
% enPhonetique/2
% enPhonetique(X,Y). X = <MOT>, Y = <PHONEMES>
enPhonetique(Mot,Trad) :-
	atom_codes(Mot,Liste),
	getPhon(Liste,Trad).

% Transforme un string en chaine ASCII.
% toString/2
% toString(X,Y). X = <CHAINE>, Y = <LISTE ASCII>
toString([],[]).
toString([T|Q],[H|C]) :-
	atom_codes(T,H),
	toString(Q,C).
	
% Traduit un mot SMS vers du Français via l'utilisation du phonètique.
% traduirePhoneme/2
% traduirePhoneme(X,Y). X = <SMS>, Y = <FRANÇAIS>
traduirePhoneme(Mot,Trad) :-
	enPhonetique(Mot,Phon),
	toString(Phon, String),
	flatten(String, Liste),
	name(Ss,Liste),
	pron(Trad,Ss).
	
traduireMot(Sms, Fr) :- dico(Sms, Fr).
traduireMot(Sms, Fr) :- traduirePhoneme(Sms, Fr).
traduireMot(Sms, Sms).

traduireMotaMot([],[]).
traduireMotaMot([Tete|Queue], [Tres|Qres]) :-
	traduireMot(Tete,Tres), traduireMotaMot(Queue,Qres).
 
traduire(Sms, Fr) :-
	chaineVersAtom(Sms, Trad),
	traduireMotaMot(Trad, Fr).
	
