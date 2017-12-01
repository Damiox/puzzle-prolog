/**
 * Utilities being used by this implementation.
 * It needs to load clpfd library for better reasoning over integers.
 * 
 * @author Damian Nardelli
 * @license WTFPL
 */

?- use_module(library(clpfd)).

%!	min_list(+List:list, -Value:int)
%	True if List when Value is the minimum value of the list
%
min_list([H], H).
min_list([H1,H2|T], S) :-
        H1 #>= H2,
        min_list([H2|T], S).
min_list([H1,H2|T], S) :-
        H1 #< H2,
        min_list([H1|T], S).

%!	max_list(+List:list, -Value:int)
%	True if List when Value is the maximum value of the list
%
max_list([H], H).
max_list([H1,H2|T], S) :-
        H1 #=< H2,
        max_list([H2|T], S).
max_list([H1,H2|T], S) :-
        H1 #> H2,
        max_list([H1|T], S).

%!	consecutive(+List:list)
%	True if List is a consecutive array of numbers. List may be an unsorted list.
%
consecutive(List) :-
        max_list(List, MaxValue),
        min_list(List, MinValue),
        length(List, N),
        MaxValue - MinValue + 1 #= N.

%!	submatrix(+Coords:list, +Matrix:list, -Values:list)
%	True if Coords are found in Matrix and their corresponding values are Values.
%
submatrix([], _, []).
submatrix([Coord|Tc], Matrix, [Value|Tv]) :-
	Coord = [X, Y],
	nth0(X, Matrix, Row),
	nth0(Y, Row, Value),
	submatrix(Tc, Matrix, Tv).


%!	sum_area3x3(+Row1:List, +Row2:List, +Row3:List, +Total:int)
%	True if the sum of all the values in the 3x3 area is equal to Total variable
%
sum_area3x3([], [], [], _).
sum_area3x3([A,B,C], [D,E,F], [G,H,I], SumArea) :-
	R = [A,B,C,D,E,F,G,H,I],
        sum(R, #=, SumArea), !.
sum_area3x3([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3], SumArea) :-
        R = [A,B,C,D,E,F,G,H,I],
	sum(R, #=, SumArea),
        sum_area3x3([B,C|Bs1], [E,F|Bs2], [H,I|Bs3], SumArea).

length_(L, Ls) :- length(Ls, L).

