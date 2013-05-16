DOCUMENTATION
=======================
<hr/>

[main.pl](main.pl)
-----------------------
<hr/>

### chaineVersAtom(Chaine, ListeAtom).
Cette règle va espacer les ponctuations présentes d'en l'atome *Chaine* puis découper ce dernirer en fonction des espaces.

Exemple :

	?- chaineVersAtom('Bonjour, Monde!',E).
	E = [bonjour, ',', '', monde, !, ''] .
	true.

### lowcase(Liste1,Liste2).
Liste1 et Liste2 : listes d'atomes.

Liste2 sera la liste contenant les atomes de Liste1 transformé en minuscule.

Exemple :

	?- lowcase(['Bonjour','Monde'],E).
	E = [bnjour, monde].
	true.

### cleanup(Liste1, Liste2).
Liste1 et Liste2 : String (liste)

La Liste2 est la Liste1 avec la ponctuation encadré d'espace.

Exemple :

	?- name('abc, de',E), cleanup(E,X).
	X = [97, 98, 99, [32, 44, 32], 32, 100, 101].
	true.

### traiterPonctuation(Chaine, ChaineTraiter).
Cette règle va traiter un atome pour espacer les ponctuations.

Exemple :

	?- traiterPonctuation('abc, de!',E).
	E = 'abc , de ! '.
	true.

### smsVersFr(Liste1, Liste2).
Liste1, Liste2 : Liste d'atome.

La liste2 correspond a l'application du prédicat dico/1 sur la liste1.

Exemple :
	
	?- smsVersFr([slt, bjr],E).
	E = [salut, bonjour].
	true.

### getPhon(Liste1, Liste2).
Liste1 : String (liste)

Liste2 : Liste d'atome

La Liste2 est la traduction en phonétique de la Liste1.

Exemple : 
	
	?- name('chateau',E), getPhon(E,F).
	E = [99, 104, 97, 116, 101, 97, 117],
	F = [k, a, t, o] .
	true.

### enPhonetique(Mot, Trad).
Mot : Atome
Trad : Liste d'atome

Trad est la traduction en phonétique de l'atome Mot.

Exemple :

	?- enPhonetique('bijour',E).
	E = [b, j, ʒ, w, ʁ] .
	true.

### toString(Liste1, Liste2).
Liste1 : Liste d'atome.

Liste2 : String (liste)

La Liste2 est le string ( liste ASCII ) qui compose tout les atomes de la Liste1.

Exemple : 

	?- toString([abc, de],E).
	E = [[97, 98, 99], [100, 101]].
	true.

### traduirePhoneme(Mot, Trad).
Mot, Trad : atome

Trad est l'équivalent de l'atome Mot suite à la traduction phonétique.

Exemple :

	?- traduirePhoneme(sha,E).
	E = chat ;
	E = chas .
	true.

### traduireMot(Sms,Fr).
Sms, Fr : Atome

Fr est l'equivalent de Sms suite à la traduction par dictionnaire, par phonétique ou par lui même.

Exemple :

	?- traduireMot(slt,R).
	R = salut .
	true.

	?- traduireMot(sha,R).
	R = chat .

### traduireMotaMot(Liste1,Liste2).
Liste1, Liste2 : Liste d'atome

La Liste2 est la Liste1 avec tout les atomes traduit.

Exemple :

	traduireMotaMot([slt,sha],E).
	E = [salut,chat] .
	true.

### traduire(Sms, Fr).
Sms : Atome

Fr : Liste d'atome.

Fr est la liste d'atome qui correspond à la traduction de l'atome SMS.

Exemple : 

	?- traduire('slt sha',E).
	E = [salut, chat] .
	true.

### display(Liste).
Liste : Liste d'atome

Affiche une liste d'atome sur stdout.

Exemple :
	
	display([bonjour, monde, !]).
	bonjour monde !
	true.

### reduireFosse.

Prend une chaine, la traduit et l'affiche.

Exemple :

	?- reduireFosse.
	Veuillez écrire la chaine à traduire :
	|: 'slt sha'.
	salut chat
	true.


