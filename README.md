Projet Technique De Première Année
===================================

Traduction du langage SMS vers le Français.
-----------------------

> Maël Naccache, Francisco Ruivo, Benjamin Fraquet, Merouane Bousbaa. |
> IUT de Nantes, Département Informatique, 1ère Année. |
> 2012 - 2013

Ce projet, réalisé dans le cadre des projets de première année pour l'IUT de Nantes,
consistais à réaliser une intelligence artificiel, en Prolog, capable de produire une phrase
française correcte à partir d'une phrase écrite en "SMS".

## Utilisation

Pour utiliser le traducteur, démarrer votre interpréteur Prolog et consulté le fichier main.pl.
Ensuite, utilisé la règle traduire/2 pour traduire votre phrase. Celle-ci produira toute les phrases française possible.

# Exemple :

	?- traduire('bjr komen va thon sha ?', E).
	
	E = [bonjour, comment, tu, va, ?] ;
	E = [bonjour, comment, tu, vas, ?] .
	
# Attention :

L'implémentation Prolog utilisé par ce projet est [SWI-Prolog](http://www.swi-prolog.org/), il n'y à aucune garanti qu'il fonctionnera sur
d'autre implémentation.

# Crédit :

Le dictionnaire phonétique français disponible dans le fichier pron.pl est adapté d'un dump du [Wiktionary](https://www.wiktionary.org/).
