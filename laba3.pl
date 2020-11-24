parent(alexei,tolia).
parent(alexei,volodia).
parent(tolia,tima).

brat(X,Y):- parent(Z,X),parent(Z,Y), X \= Y.

:-op(200,xfy,':').

fid(X,XC,K,File1):- member(M,File1), condition(X,XC,K,M).
condition(X,XC,K,XC:K:L):- member(X,L).

gen1(File1):- File1 = ['alexei':type('1'):['alexei'],'tolia':type('1'):['tolia'],'volodia':type('1'):['volodia'],
'tima':type('1'):['tima'],'kto':type('2'):['kto'],'chei':type('3'):['chei'] ].
gen2(File2):- File2 = ['alexei':pad('им'):['alexei'],'tolia':pad('им'):['tolia'],'volodia':pad('им'):['volodia'],
'tima':pad('им'):['tima'],'alexei':pad('род'):['alexey'],'tolia':pad('род'):['toli'],'volodia':pad('род'):['volodi'],
'tima':pad('род'):['timi'],'alexei':pad('незнаюкакойпадеж'):['leshin'],'tolia':pad('незнаюкакойпадеж'):['tolin'],
'volodia':pad('незнаюкакойпадеж'):['volodin'],'tima':pad('незнаюкакойпадеж'):['timin'] ].

yes_or_no(X1,X2,Y):- brat(X1,X2), !, Y = ['Yes'].
yes_or_no(X1,X2,Y):- not(brat(X1,X2)), !, Y = ['No'].

an_question(Y,type('1'),[A,B,C,D]):-
an_first_word(X1,type('1'),A),
B = 'brat',
an_name(X2,pad('род'),C),
D = '?',
yes_or_no(X1,X2,Y).

an_question(Y,type('2'),[A,B,C,D]):-
an_first_word(X1,type('2'),A),
an_name(X2,pad('незнаюкакойпадеж'),B),
C = 'brat',D = '?',
brat(Y,X2).

an_question(Y,type('3'),[A,B,C,D]):-
an_first_word(X1,type('3'),A),
B = 'brat',
an_name(X2,pad('им'),C),
D = '?',
brat(Y,X2).

an_first_word(XC,K,X):- gen1(File1), fid(X,XC,K,File1).
an_name(XC,K,Y):- gen2(File2), fid(Y,XC,K,File2).

answer(X,[A,B,C,D]):- an_question(X,Z,[A,B,C,D]).
