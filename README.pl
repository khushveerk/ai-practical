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

% --- Q2: Concatenate Lists ---

conc([], List2, List2).
conc([Head|Tail], List2, [Head|ResultTail]) :-
    conc(Tail, List2, ResultTail).

%-----or------

conc([],L2,L2).
conc([H|L1],L2,[H|T]):- conc(L1,L2,T).New = [Element | Old].


% --- Q3: Reverse List ---

reverse([], []).
reverse([Head|Tail], Result) :-
    reverse(Tail, ReversedTail),
    conc(ReversedTail, [Head], Result).



% --- Q4: Sum ---

sum(Number1, Number2, Result) :-
    Result is Number1 + Number2.



% --- Q5: Maximum ---

max(Number1, Number2, Number1) :-
    Number1 >= Number2.

max(Number1, Number2, Number2) :-
    Number2 > Number1.



% --- Q6: Factorial ---

factorial(0, 1).
factorial(Number, Result) :-
    Number > 0,
    Next is Number - 1,
    factorial(Next, Temp),
    Result is Number * Temp.

% --- Q7: Fibonacci ---

generate_fib(0, 0).
generate_fib(1, 1).
generate_fib(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    generate_fib(N1, F1),
    generate_fib(N2, F2),
    Result is F1 + F2.

% --- Q8: Power ---

power(_, 0, 1).
power(Number, Pow, Result) :-
    Pow > 0,
    NewPow is Pow - 1,
    power(Number, NewPow, Temp),
    Result is Number * Temp.

% --- Q9: Multiplication ---

multi(_, 0, 0).
multi(Number, Times, Result) :-
    Times > 0,
    NewTimes is Times - 1,
    multi(Number, NewTimes, Temp),
    Result is Temp + Number.


% --- Q10: Member ---

memb(Element, [Element|Tail]).
memb(Element, [Head|Tail]) :-
    memb(Element, Tail).

% --- Q11: Sum of List ---

sumlist([], 0).
sumlist([Head|Tail], Result) :-
    sumlist(Tail, Temp),
    Result is Temp + Head.

% --- Q12: Even and Odd Length ---

evenlength([]).
evenlength([Head1, Head2 | Tail]) :-
    evenlength(Tail).

oddlength([Head]).
oddlength([Head1, Head2 | Tail]) :-
    oddlength(Tail).

% --- Q13: Max in List ---

maxlist([Head], Head).
maxlist([Head|Tail], Max) :-
    maxlist(Tail, TempMax),
    (Head > TempMax -> Max = Head ; Max = TempMax).

% --- Q14: Insert at Nth Position ---

insert(Element, 1, List, [Element|List]).
insert(Element, Position, [Head|Tail], [Head|ResultTail]) :-
    Position > 1,
    NewPos is Position - 1,
    insert(Element, NewPos, Tail, ResultTail).

% --- Q15: Delete Nth Element ---

delete(_, 1, [_|T], T).
delete(N, Pos, [H|T], [H|R]) :-
    Pos > 1,
    Pos1 is Pos - 1,
    delete(N, Pos1, T, R).








% --- Q: Delete First Occurrence ---

delete(Element, [Element|Tail], Tail).
delete(Element, [Head|Tail], [Head|ResultTail]) :-
    delete(Element, Tail, ResultTail).

%----------or----

delete(X,[X|L],L).
delete(X,[H|L],L3):- delete(X,L,L3).



