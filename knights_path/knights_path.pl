

/*  Knights Path  */

next(X/Y,NX/NY) :-
	X > 0, X < 9, Y > 0, Y < 9,
        NX is X + 2, NY is Y - 1;
	NX is X + 2, NY is Y + 1;
	NX is X + 1, NY is Y + 2;
	NX is X - 1, NY is Y + 2;
	NX is X - 2, NY is Y + 1;
	NX is X - 1, NY is Y - 2;
	NX is X + 1, NY is Y - 2.


possible_moves(X/Y,NX/NY) :-
	X > 0, X < 9, Y > 0, Y < 9,
	next(X/Y,NX/NY),
	NX > 0, NX < 9, NY > 0, NY < 9.


path_loop(_,_/_,End,_,Lt,NP) :-
	reverse(Lt,NP),
	last(NP,End).

path_loop(C,X/Y,End,L,Path,Lt) :-
	(C >= L, not(nth0(0,Path,End)) -> false);
	(C >= L, (nth0(0,Path,End)) -> true);
	possible_moves(X/Y,NX/NY),
	C1 is C + 1,
	path_loop(C1,NX/NY,End,L,[NX/NY|Path],Lt).


knightjourney(X/Y,End,L) :-
	knightpath(X/Y,End,L,Path),
	length(Path,L).

knightpassthru(Path,X/Y,N) :-
	nth1(N,Path,X/Y).

knightpath(X/Y,End,L,Path) :-
	L1 is L - 1,
	path_loop(0,X/Y,End,L1,[X/Y],Path),
	length(Path,L) -> !.


/* Michael Zekert (18th December 2016) */


