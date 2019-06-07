

/* Longest Common Prefix */

:- set_prolog_flag(double_quotes, chars).

find_last([Last],Last).
find_last([_|T],Last):- find_last(T,Last).

to_string(List,New):- atomic_list_concat(List,'',New).
comb(L,New):- findall(P, common_p(P,L), New).

add_prefix(P,L):- append(P,_,L).
common_p(P,L):- maplist(add_prefix(P),L).

most_common(L):-
	comb(L,P),
	find_last(P,Last),
	maplist(term_to_atom, Last, A1),
	to_string(A1, S),
	write('Most common prefix:  '),
	write(S),!.


/* Michael Zekert (10th December 2017) */

