SELECT DISTINCT recipes.name
FROM recipes 
INNER JOIN steps ON steps.recipe_id=recipes.id 
INNER JOIN ingredients ON ingredients.step_id=steps.id 
INNER JOIN recipe_tags ON recipe_tags.recipe_id=recipes.id
INNER JOIN tags ON tags.id=recipe_tags.tag_id
WHERE (tags.name="Entrees"  OR tags.name="Desserts") AND ingredients.name="cinnamon";
