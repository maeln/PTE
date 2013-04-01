% Fichier de dictionnaire.
% dico(X,Y) est la base de connaissance ou :
%	- X est le mot en sms.
%	- Y est son equivalent en Français.
%

dico(bjr,bonjour).
dico(slt,salut).
dico(cb,combien).
dico(mdr,'mort de rire').

% Cette règle indique que si le mot n'est pas trouver dans le dictionnaire, on va tenter de le chercher dans le dictionnaire personnel.
dico(E,G) :- dicoperso(E,G).
