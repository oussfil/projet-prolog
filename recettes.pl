% Définition des recettes et leurs ingrédients
recipe(pizza, [farine, eau, sel, levure, tomate, fromage]).
recipe(salade, [laitue, tomate, concombre, vinaigre, huile]).
recipe(pates_carbonara, [pates, creme, lardons, fromage, sel, poivre]).
recipe(omelette, [oeufs, sel, poivre, fromage]).
recipe(sandwich, [pain, beurre, jambon]).

% Vérifie si tous les ingrédients requis sont disponibles
has_all_ingredients(Recipe, Available) :-
    recipe(Recipe, Required),
    subset(Required, Available).

% Trouve toutes les recettes possibles avec les ingrédients disponibles
find_possible_recipes(Available, Recipes) :-
    findall(Recipe, has_all_ingredients(Recipe, Available), Recipes).

% Exemples d'utilisation :
% ?- find_possible_recipes([farine, eau, sel, levure, tomate, fromage, lardons], Recipes).
% ?- find_possible_recipes([oeufs, sel, poivre, fromage, jambon], Recipes).