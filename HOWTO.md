HOW TO USE
========================================

## Interpréteur Prolog

Ce programme à été développé avec SWI-Prolog 6.2.6. Afin de l’exécuter il vous faut télécharger [SWI-Prolog](http://www.swi-prolog.org/download/stable).

Une fois ceci fait, il vous faut ouvrir l’interpréteur dans le dossier du projet.

## Télécharger le programme

Sous GNU/Linux faite les commandes suivantes :

	$ wget https://github.com/maeln/PTE/archive/master.zip -O sms.zip
	$ unzip sms.zip & cd PTE-master
	$ swipl
	
## Utiliser le projet

Une fois dans l’interpréteur SWI-Prolog, un invité de commande devrait apparaître.

Il vous faut consulter le fichier du projet, pour cela faite :

	?- [main].
	
ou
	
	?- consult(main).
	
L’interpréteur devrais charger tout les fichiers nécessaire ( Attention, le dictionnaire phonétique peut prendre quelque minutes à ce charger ).

Pour traduire, vous pouvez au choix utiliser les règles *traduire/2* ou *reduireFosse/0*

	?- traduire('<Votre Message SMS>', E).
	E = <Traduction du Message>.
	
ou

	?- reduireFosse.
	veuillez entrer le message à traduire :
	|: '<Votre message SMS>'.
	<Traduction du Message>
	
*Attention : Pour le prédicat reduireFosse il est important d'encadrer votre message d'apostrophe et de terminer la ligne par un point.*

Afin de faire défiler les différentes traductions possibles, appuyer sur ";", une fois satisfait, appuyer sur Entrée pour revenir à l'invité de commande.
