# ai-practical

% --- Q1: Family Tree ---

male(raj).
male(karan).
male(aman).

female(sita).
female(neha).
female(ria).

parent(raj, karan).
parent(sita, karan).
parent(karan, aman).
parent(neha, aman).
parent(raj, ria).

father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

brother(Brother, Person) :-
    male(Brother),
    parent(Parent, Brother),
    parent(Parent, Person),
    Brother \= Person.

sister(Sister, Person) :-
    female(Sister),
    parent(Parent, Sister),
    parent(Parent, Person),
    Sister \= Person.

grandparent(Grandparent, Child) :-
    parent(Grandparent, Parent),
    parent(Parent, Child).

predecessor(Parent, Child) :-
    parent(Parent, Child).

ancestor(Ancestor, Person) :-          % Base case
    parent(Ancestor, Person).

ancestor(Ancestor, Person) :-          % Recursive case
    parent(Ancestor, Middle),
    ancestor(Middle, Person).

% queries- 
% ?- father(F, karan).
% ?- father(F, C). then press - ;
% ?- mother(M, karan).
% ?- grandparent(G, aman).
% ?- ancestor(A, aman).



% --- Q2: Concatenate Lists ------------------------------------------------------

conc([], List2, List2).
conc([Head|Tail], List2, [Head|ResultTail]) :-
    conc(Tail, List2, ResultTail).

% queries- 
% ?- conc([1,2,3], [4,5,6], R).
% ?- conc([], [a,b,c], R).
% ?- conc("hi", "there", R).
% ?- conc(A, [4,5], [1,2,3,4,5]).  --Find the first part of a list 
% ?- conc(A, B, [1,2,3]).   --Generate all splits of a list

%-----or------

conc([],L2,L2).
conc([H|L1],L2,[H|T]):- conc(L1,L2,T).New = [Element | Old].

% --- Q3: Reverse List ---------------------------------------------------------

reverse([], []).
reverse([Head|Tail], Result) :-
    reverse(Tail, ReversedTail),
    conc(ReversedTail, [Head], Result).
% queries- 
% ?- reverse([1,2,3,4], R).
% ?- reverse([a,b,c,d], R).
% ?- reverse([apple, 12, x, hello], R).  -- Reverse a mixed list
% ?- reverse(L, [3,2,1]).  ---Find original list from a reversed one
% ?- reverse([r,a,d,a,r], [r,a,d,a,r]).   -- Check if a list is a palindrome 

% --- Q4: Sum ---------------------------------------------------------

sum(Number1, Number2, Result) :-
    Result is Number1 + Number2.

% queries- 
% ?- sum(5, 7, R).
% ?- sum(10, -4, R).  ---Adding a positive and negative number
% ?- sum(2.5, 3.7, R).
% ?- sum(A, 9, 20).   --- Query with variable inputs
% ?- sum(40, 60, 100).  --- Check if two numbers sum to 100


% --- Q5: Maximum ---------------------------------------------------------

max(Number1, Number2, Number1) :-
    Number1 >= Number2.

max(Number1, Number2, Number2) :-
    Number2 > Number1.
    
%-----------or-------
% Q5: Maximum of two numbers

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.

% queries- 
% ?- max(10, 5, M).
% ?- max(7, 12, M).
% ?- max(8, 8, M).


% --- Q6: Factorial ---------------------------------------------------------

factorial(0, 1).
factorial(Number, Result) :-
    Number > 0,
    Next is Number - 1,
    factorial(Next, Temp),
    Result is Number * Temp.

% queries- 
% ?- factorial(5, R).
% ?- factorial(7, R).
% ?- factorial(N, 120).   ---Check if a factorial is true.

% --- Q7: Fibonacci ---------------------------------------------------------

generate_fib(0, 0).
generate_fib(1, 1).
generate_fib(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    generate_fib(N1, F1),
    generate_fib(N2, F2),
    Result is F1 + F2.

% queries- 
% ?- generate_fib(5, R).
% ?- generate_fib(10, R).
% ?- generate_fib(N, 13).   ---Find N for which Fibonacci is 13.

% --- Q8: Power ---------------------------------------------------------

power(_, 0, 1).
power(Number, Pow, Result) :-
    Pow > 0,
    NewPow is Pow - 1,
    power(Number, NewPow, Temp),
    Result is Number * Temp.

% queries- 
% ?- power(2, 3, R).
% ?- power(X, 4, 16).  ---Find bases whose power returns 16.

% --- Q9: Multiplication ---------------------------------------------------------

multi(_, 0, 0).
multi(Number, Times, Result) :-
    Times > 0,
    NewTimes is Times - 1,
    multi(Number, NewTimes, Temp),
    Result is Temp + Number.
    
% queries- 
% ?- multi(5, 3, Result).
% ?- multi(3, 5, 15).

% --- Q10: Member ---------------------------------------------------------

memb(Element, [Element|Tail]).
memb(Element, [Head|Tail]) :-
    memb(Element, Tail).

% queries- 
% ?- memb(3, [1,2,3,4,5]).  -- Expected: true
% ?- memb(X, [a,b,c]).  -- Expected: X = a ; X = b ; X = c.

% --- Q11: Sum of List ---------------------------------------------------------

sumlist([], 0).
sumlist([Head|Tail], Result) :-
    sumlist(Tail, Temp),
    Result is Temp + Head.

% queries- 
% ?- sumlist([1,2,3,4,5], Result).  ---Expected: Result = 15
% ?- sumlist([5,5,5,5], 20).   --- Expected: true

% --- Q12: Even and Odd Length ---------------------------------------------------------

evenlength([]).
evenlength([Head1, Head2 | Tail]) :-
    evenlength(Tail).

oddlength([Head]).
oddlength([Head1, Head2 | Tail]) :-
    oddlength(Tail).

% queries- 
% ?- evenlength([a,b,c,d]).  -- Expected: true
% ?- oddlength([1,2,3,4]).    ---Expected: false
% ?- oddlength([x]).   --- Expected: true

% --- Q13: Max in List ---------------------------------------------------------

maxlist([Head], Head).
maxlist([Head|Tail], Max) :-
    maxlist(Tail, TempMax),
    (Head > TempMax -> Max = Head ; Max = TempMax).
    
% queries- 
% ?- maxlist([3, 5, 2, 9, 1], Max).   --- Expected: Max = 9
% ?- maxlist([3, 5, 2, 9, 1], 9).  ---Check if a given value is the maximum ,Expected: true


% --- Q14: Insert at Nth Position ---------------------------------------------------------

insert(Element, 1, List, [Element|List]).
insert(Element, Position, [Head|Tail], [Head|ResultTail]) :-
    Position > 1,
    NewPos is Position - 1,
    insert(Element, NewPos, Tail, ResultTail).

% queries- 
% Insert at the beginning
% ?- insert(a, 1, [b,c,d], Result).
% Expected: Result = [a,b,c,d]

% Insert in the middle
% ?- insert(x, 3, [1,2,3,4], Result).
% Expected: Result = [1,2,x,3,4]

% Insert at the end
% ?- insert(9, 5, [1,2,3,4], Result).
% Expected: Result = [1,2,3,4,9]

% Check if a given result is correct
% ?- insert(7, 2, [1,2,3], [1,7,2,3]).
% Expected: true


% --- Q15: Delete Nth Element ---------------------------------------------------------

delete(_, 1, [_|T], T).
delete(N, Pos, [H|T], [H|R]) :-
    Pos > 1,
    Pos1 is Pos - 1,
    delete(N, Pos1, T, R).

% queries- 
% Delete the first element
% ?- delete(_, 1, [a,b,c,d], Result).
% Expected: Result = [b,c,d]

% Delete the third element
% ?- delete(_, 3, [1,2,3,4,5], Result).
% Expected: Result = [1,2,4,5]

% Delete the last element
% ?- delete(_, 4, [x,y,z,w], Result).
% Expected: Result = [x,y,z]

% Check if a given result is correct
% ?- delete(_, 2, [10,20,30], [10,30]).
% Expected: true

% Using a variable to get the deleted element
% ?- delete(Element, 2, [a,b,c], Result).
% Expected: Element = b, Result = [a,c]






% --- Q: Delete First Occurrence ---------------------------------------------------------

delete(Element, [Element|Tail], Tail).
delete(Element, [Head|Tail], [Head|ResultTail]) :-
    delete(Element, Tail, ResultTail).

%----------or----

delete(X,[X|L],L).
delete(X,[H|L],L3):- delete(X,L,L3).



