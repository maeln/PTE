% Cette fonction transforme une chaine en liste d'atom qui vont être nos "mots".
% Nous choisissons de les découper à chaque espace du à l'Axiome n°1.
% Il nous reste à réaliser la suppressions des ponctiations.
chaineVersAtom(Chaine, ListeAtom) :-
	atomic_list_concat(ListeAtom, ' ', Chaine).

% smsVersFR applique les correspondances présentes dans les dictionnaires de manière recursive, mot-à-mot.
smsVersFr([],[]).
smsVersFr( [Tete|Queue], [Tres|Qres]) :-
	ensure_loaded(dictionnaire), ensure_loaded(dictionnaireperso), % On vérifie juste que les dictionnaires sont bien chargé. La magie commence à la ligne suivante.
	dico(Tete,Tres), smsVersFr(Queue,Qres).
	
% Cette règle permet d'ajouter un mot au dictionnaire personnel.
ajouterDicoPerso(MotSms, MotFr) :-
	open('basemotperso.pl', append, File),
		format(File, 'dicoperso(~a,\'~a\').~n', [MotSms,MotFr]),
	close(File).
