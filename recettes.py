def find_recipes_imperative(available_ingredients):
    recipes = {
        'Pizza': ['farine', 'eau', 'sel', 'levure', 'tomate', 'fromage'],
        'Salade': ['laitue', 'tomate', 'concombre', 'vinaigre', 'huile'],
        'Pates Carbonara': ['pates', 'creme', 'lardons', 'fromage', 'sel', 'poivre'],
        'Omelette': ['oeufs', 'sel', 'poivre', 'fromage'],
        'Sandwich': ['pain', 'beurre', 'jambon']
    }
    possible_recipes = []
    for recipe_name, required_ingredients in recipes.items():
        can_make = True
        for ingredient in required_ingredients:
            if ingredient not in available_ingredients:
                can_make = False
                break
        if can_make:
            possible_recipes.append(recipe_name)
    return possible_recipes

# Tests du programme
test1 = ['farine', 'eau', 'sel', 'levure', 'tomate', 'fromage']
print("Test 1 - Ingrédients disponibles:", test1)
print("Recettes possibles:", find_recipes_imperative(test1))

test2 = ['farine', 'eau', 'sel', 'levure', 'tomate', 'fromage', 'oeufs', 'poivre']
print("\nTest 2 - Ingrédients disponibles:", test2)
print("Recettes possibles:", find_recipes_imperative(test2))

test3 = ['oeufs', 'sel', 'poivre', 'fromage']
print("\nTest 3 - Ingrédients disponibles:", test3)
print("Recettes possibles:", find_recipes_imperative(test3))