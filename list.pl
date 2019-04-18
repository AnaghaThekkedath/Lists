% is_a_list(X):- True if X is True.
is_a_list([]).
is_a_list([_, Tail]):-
    is_a_list(Tail).

%head_tail(X):- Head and Tail of X.
head_tail([Head|Tail],Head,Tail).

% is_member(E,L):- E is element of L. 
is_member(Element, [Element| _]).   
is_member(Element, [_, Tail]):-
    is_member(Element, Tail).

% sum_all(List, Sum):- Sum is the sum of elements of list L.
sum_all([],0).
sum_all([Head|Tail],Sum):-
    sum_all(Tail,Tailsum),
    Sum is Tailsum+Head.

% cons(List1, List2, List3):- List3 is List1 and List2 concatinated.
cons([],L,L).
cons([Head|Tail],List,[Head|Tailresult]):-
    cons(Tail,List,Tailresult).


% sumsq_even(List, Sum):- Sum is the sum of squares of the even numbers the list.
% ?- sumsq_even([1,3,5,2,-4,6,8,-7], Sum).
% Sum = 120.
% ?- sumsq_even([1,3,-5,-7,9], Sum).
% Sum = 0.
% ?- sumsq_even([], Sum).
% Sum = 0.
% ?- sumsq_even([2,4,6], Sum).
% Sum = 56.

% Base Case when list is empty
sumsq_even([],0).
% Number is odd.
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail, Tailsum),
    1 is Head mod 2,
    Sum is Tailsum.
% Number is even.
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail, Tailsum),
    0 is Head mod 2,
    Sum is Tailsum + Head^2.


% sqrt_list(NumberList, ResultList):- ResultList is a list of pairs of each number from NumberList and its squareroot
% ?- sqrt_list([0,2,289], Result).
% Result = [[0, 0.0], [2, 1.4142135623730951], [289, 17.0]].
% ?- sqrt_list([],Result).
% Result = [].
% ?- sqrt_list([1],Result).
% Result = [[1, 1.0]].

% base case when list is empty
sqrt_list([],[]).
% recursive case for all other cases
sqrt_list([Head|Tail],[[Head,HeadResult]|TailResult]):-
    HeadResult is sqrt(Head),
    sqrt_list(Tail,TailResult).



% sign_runs(List, RunList) :- RunList is the list of sign runs for List.
% ?- sign_runs([8,-1,-3,0,2,0,-4], RunList).
% RunList = [[8], [-1, -3], [0, 2, 0], [-4]].
% ?- sign_runs([8,-1,-3,0,2,0,-4,10,12,0,-3,-2,-5,19,10,20,0,-10], RunList).
% RunList = [[8], [-1, -3], [0, 2, 0], [-4], [10, 12, 0], [-3, -2, -5], [19, 10|...], [-10]] .

% base case when list is empty
sign_runs([],[]).
% Case with only one element.
sign_runs([F],[[F]]).
% When Elements are both positive.
sign_runs([First|[Second|Tail]],[[First|TailResultHead]|TailResultTail]) :-
	First>=0,
	Second>=0,
	sign_runs([Second|Tail],[TailResultHead|TailResultTail]).
% When Elements are both negative.
sign_runs([First|[Second|Tail]],[[First|TailResultHead]|TailResultTail]) :-
	First<0,
	Second<0,
	sign_runs([Second|Tail],[TailResultHead|TailResultTail]).
% When they have different signs
sign_runs([First|[Second|Tail]],[[First]|TailResult]) :-
	First<0,
	Second >=0,
	sign_runs([Second|Tail],TailResult).
sign_runs([First|[Second|Tail]],[[First]|TailResult]) :-
	First>=0,
	Second <0,
	sign_runs([Second|Tail],TailResult).


