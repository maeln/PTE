%ajouterDicoPerso(MotSms, MotFr) :-
%	open('basemotperso.pl', append, File),
%		format(File, 'dicoperso(\'~a\',\'~s\').~n', [MotSms,MotFr]),
%	close(File).

:- [alphabet_pron].

toArray(Phoneme) :-
	pron(J,Phoneme),name(J,B),
	write('phon('),
	write(B), write(',\''),
	write(Phoneme), write('\').'),nl,
	fail.

toArray.