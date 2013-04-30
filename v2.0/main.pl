main :-
	write('Bienvenue dans le traducteur SMS -> Français !'), nl,
	write('Chargement du dictionnaire SMS->Français ...'), [dictionnaire], write(' Fait !'), nl,
	write('Chargement du dictionnaire personnel ...'), [dictionnaireperso], write(' Fait !'), nl,
	write('Chargement du fichier de règles ...'), [rules], write(' Fait !'), nl,
	traduireMessage.

traduireMessage :-
	write('Veuillez rentrer la chaîne à traduire :'), nl,
	read(Message), chaineVersAtom(Message, ListeDatom), smsVersFr(ListeDatom, Resultat), nl,
	write('Le message traduit est : '), nl, write(Resultat).
