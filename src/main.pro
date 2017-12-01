/**
 * Main program - Puzzle Solver
 * Logic to solve this puzzle through logic programming.
 * 
 * @author Damian Nardelli
 * @license WTFPL
 */

?- load_files(['examples.pro', 'util.pro']).

%!	puzzle_solver()
%	True if all the defined Problems can be solved through this Puzzle.
%
puzzle_solver :-
	example(Grid, Regions),
	statistics(runtime, _),
	puzzle_solver(Grid, Regions),
	statistics(runtime, [_,Time]),
	maplist(writeln, Grid),
	format('CPU Time = ~0fms\n\n', Time).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%!	puzzle_solver(+Grid:list, +Regions:list)
%	True if the Grid is valid. A grid is valid iff:
%	a) Values must be between [1,9]. 
%	b) The sum of values in every 3x3 area must be the same.
%	c) All Regions have unique and consecutive numbers.
%
puzzle_solver(Grid, Regions) :-
	grid(Grid),
	areas(Grid, _),
	regions(Regions, Grid).

%!	grid(+Grid:list)
%	True if the Grid is 6x6 and all values are between [1,9].
%
grid(Grid) :-
	length(Grid, 6),
	maplist(length_(6), Grid),
	append(Grid, Values),
	Values ins 1..9.

%!	areas(+Grid:list, -SumArea)
%	True if the sum of values in every 3x3 area is always equal to SumArea
%
areas([A,B,C], SumArea) :-
	sum_area3x3(A, B, C, SumArea).
areas([A,B,C|T], SumArea) :-
	sum_area3x3(A, B, C, SumArea),
	areas([B,C|T], SumArea).

%!	regions(+Regions:list, +Grid:list)
%	True if each defined Region in the Grid has unique and consecutive values between [1,9].
%
regions([], _).
regions([Region|T], Grid) :-
	submatrix(Region, Grid, Values),
	Values ins 1..9,
	all_distinct(Values),
	consecutive(Values),
	regions(T, Grid).

