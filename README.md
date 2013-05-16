Projet Technique De Première Année
===================================

Traduction du langage SMS vers le Français.
-----------------------

> Maël Naccache, Francisco Ruivo, Benjamin Fraquet, Merouane Bousbaa. |
> IUT de Nantes, Département Informatique, 1ère Année. |
> 2012 - 2013

Ce projet, réalisé dans le cadre des projets de première année pour l'IUT de Nantes,
consistait à réaliser une intelligence artificielle, en Prolog, capable de produire une phrase
française correcte à partir d'une phrase écrite en "SMS".

## Utilisation

Pour utiliser le traducteur, démarrez votre interpréteur Prolog et consultez le fichier main.pl.
Ensuite, utilisez la règle traduire/2 pour traduire votre phrase. Celle-ci produira toutes les phrases françaises possibles.

# Exemple :

	?- traduire('bjr komen tu va ?', E).
	
	E = [bonjour, comment, tu, va, ?] ;
	E = [bonjour, comment, tu, vas, ?] .
	
# Attention :

L'implémentation Prolog utilisée par ce projet est [SWI-Prolog](http://www.swi-prolog.org/), il n'y a aucune garantie qu'il fonctionnera sur
d'autres implémentations.

# Crédit :

Le dictionnaire phonétique français disponible dans le fichier pron.pl est adapté d'un dump du [Wiktionary](https://www.wiktionary.org/).
