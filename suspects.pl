% 1. Déclaration des suspects
suspect(drago).
suspect(neville).
suspect(ginny).

% 2. Déclarations des suspects
declaration(drago, guilty(drago), innocent(neville)).
declaration(neville, guilty(drago), innocent(ginny)).
declaration(ginny, guilty(ginny), (innocent(drago), innocent(neville))).

% 3. Définition de base pour guilty/1 (sera utilisé par solve/1)
:- dynamic guilty/1.

% 4. Relation entre innocent et guilty
innocent(X) :- suspect(X), \+ guilty(X).

% 5. Règle pour vérifier toutes les déclarations
verify_declarations :-
    declaration(drago, If1, Then1),
    (If1 -> Then1 ; true),
    declaration(neville, If2, Then2),
    (If2 -> Then2 ; true),
    declaration(ginny, If3, Then3),
    (If3 -> Then3 ; true).

% 6. Règle pour vérifier qu'il n'y a qu'un seul coupable
one_guilty :-
    findall(X, guilty(X), L),
    length(L, 1).

% 7. Règle principale pour résoudre le problème
solve(Culprit) :-
    suspect(Culprit),
    retractall(guilty(_)),            % Efface les anciens faits
    assertz(guilty(Culprit)),         % Pose l'hypothèse
    verify_declarations,              % Vérifie que toutes les déclarations sont vraies
    one_guilty,                       % Vérifie qu'il n'y a qu'un seul coupable
    !.                               % Coupe pour éviter le backtracking inutile

% 8. Test pour afficher la solution
find_culprit :-
    solve(X),
    format('Le coupable est ~w~n', [X]),
    findall(Y, guilty(Y), L),
    format('Liste des coupables : ~w~n', [L]).