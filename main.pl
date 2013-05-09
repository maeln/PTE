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
	traiterPonctuation(Chaine, ChainePonc),
	atomic_list_concat(Atoms, ' ', ChainePonc),
	lowcase(Atoms, ListeAtom).

% Cette règles transforme tout caractère majuscule en minuscule.
lowcase([],[]).
lowcase([T1|R],[H|Q]) :- downcase_atom(T1,H), lowcase(R,Q).

% S'occupe de traiter la ponctuation.
ponc(44, [32,44,32]).
ponc(46, [32,46,32]).
ponc(63, [32,63,32]).
ponc(33, [32,33,32]).
ponc(58, [32,58,32]).
ponc(59, [32,59,32]).
ponc(E,E).

cleanup([],[]).
cleanup([T|R], [H|Q]) :- ponc(T,H), cleanup(R,Q).

traiterPonctuation(Chaine, ChaineTraiter) :-
	name(Chaine, Liste), cleanup(Liste, ListeTraiter),
	flatten(ListeTraiter, Final), name(ChaineTraiter, Final).
	
% smsVersFR applique les correspondances présentes dans les dictionnaires de manière recursive, mot-à-mot.
% smsVersFR/2
% smsVersFR(X,Y). X = <LISTE MOT SMS>, Y = <LISTE MOT FRANÇAIS>
smsVersFr([],[]).
smsVersFr([Tete|Queue],[Tres|Qres]) :-
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
	
% Écrit une liste d'atome sous la forme d'une chaine propre sur la console.
display([]).
display([T|Q]) :- write(T), write(' '), display(Q).
	

% Traduction de manière "user-frienly".
% Ne renvoie que la première traduction possible.
% Donc, c'est nul.
reduireFosse :-
	write('Veuillez écrire la chaine à traduire :'),nl,
	read(X), traduire(X,Fr), display(Fr).
