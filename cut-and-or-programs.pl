% Combined Example (Cut + AND + OR) ------------

grade(Marks, pass) :-
    Marks >= 33,
    Marks < 90, !.

grade(Marks, excellent) :-
    Marks >= 90, !.

grade(_, fail).    % default

result(X) :-
    grade(X, excellent) ;
    grade(X, pass).
    
 % queries --
 % ?- grade(95, G).
 % ?- grade(40, G).
 % ?- result(95).

% Determining age category using cut-----------------------
age_category(Age, child) :-
    Age < 13, !.

age_category(Age, teenager) :-
    Age >= 13,
    Age < 20, !.

age_category(_, adult).

% queries---
% ?- age_category(10, C).
% ?- age_category(15, C).
