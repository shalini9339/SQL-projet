
create table Recipe (Recipe_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Recipe_name VARCHAR(255) not null, preparation_time int ); 

create table Ingredient (ingredient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ingredient_name VARCHAR(100) not null unique); 

create table RecipeIngredients (Recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(50) NOT NULL,
    PRIMARY KEY (Recipe_id, ingredient_id),
    FOREIGN KEY (Recipe_id) REFERENCES Recipe(Recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

INSERT INTO Ingredient (ingredient_name) VALUES
('Flour'),
('Sugar'),
('Eggs'),
('Milk'),
('Chocolate');

INSERT INTO Recipe (Recipe_name, instructions, preparation_time) VALUES
('Chocolate Cake', 'Mix ingredients and bake at 350°F for 30 minutes.', 45),
('Pancakes', 'Whisk ingredients and cook on a griddle.', 20);

INSERT INTO RecipeIngredients (Recipe_id, ingredient_id, quantity) VALUES
(1, 1, '2 cups'),
(1, 2, '1.5 cups'),
(1, 3, '3'),
(1, 4, '1 cup'),
(1, 5, '1 cup'),
(2, 1, '1.5 cups'),
(2, 3, '2'),
(2, 4, '1.5 cups');

 INSERT INTO Ingredients (ingredient_name) VALUES
('Flour'),
('Sugar'),
('Eggs'),
('Milk'),
('Chocolate');

INSERT INTO Recipes (recipe_name, instructions, preparation_time) VALUES
('Chocolate Cake', 'Mix ingredients and bake at 350°F for 30 minutes.', 45),
('Pancakes', 'Whisk ingredients and cook on a griddle.', 20);

INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity) VALUES
(1, 1, '2 cups'),
(1, 2, '1.5 cups'),
(1, 3, '3'),
(1, 4, '1 cup'),
(1, 5, '1 cup'),
(2, 1, '1.5 cups'),
(2, 3, '2'),
(2, 4, '1.5 cups');


 INSERT INTO Ingredients (ingredient_name) VALUES
('Flour'),
('Sugar'),
('Eggs'),
('Milk'),
('Chocolate');

INSERT INTO Recipe (Recipe_name, preparation_time, instrutions) VALUES
('Chocolate Cake',45, 'Mix ingredients and bake at 350°F for 30 minutes.'),
('Pancakes',25, 'Whisk ingredients and cook on a griddle.');

INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity) VALUES
(1, 1, '2 cups'),
(1, 2, '1.5 cups'),
(1, 3, '3'),
(1, 4, '1 cup'),
(1, 5, '1 cup'),
(2, 1, '1.5 cups'),
(2, 3, '2'),
(2, 4, '1.5 cups');


alter table Recipe add column instrutions text not null;
select*from Recipe;
select*from Ingredient;
select*from RecipeIngredients;

UPDATE Recipe SET preparation_time = 50 WHERE recipe_id = 1;

-- Select recipes with WHERE and AND
SELECT * FROM Recipe WHERE preparation_time > 30 AND preparation_time < 60;

-- Joins
SELECT Recipe.recipe_name, Ingredient.ingredient_name, RecipeIngredients.quantity
FROM Recipe
JOIN RecipeIngredients ON Recipe.recipe_id = RecipeIngredients.recipe_id
JOIN Ingredient ON RecipeIngredients.ingredient_id = Ingredient.ingredient_id;

-- Aggregation functions
SELECT ingredient_name, COUNT(*) AS total_recipe
FROM RecipeIngredients
JOIN Ingredient ON RecipeIngredients.ingredient_id = Ingredient.ingredient_id
GROUP BY ingredient_name
HAVING total_recipe > 1;

-- Subquery
SELECT Recipe_name
FROM Recipe
WHERE Recipe_id IN (SELECT Recipe_id FROM RecipeIngredients WHERE ingredient_id = 1);

-- UNION and UNION ALL
SELECT Recipe_id, Recipe_name FROM Recipe WHERE preparation_time < 30
UNION ALL
SELECT Recipe_id, Recipe_name FROM Recipe WHERE preparation_time >= 30;

-- ORDER BY
SELECT * FROM Recipe ORDER BY preparation_time DESC;

-- LIKE and wildcards
SELECT * FROM Ingredient WHERE ingredient_name LIKE '%Chocolate%';

-- NULL and NOT NULL
SELECT * FROM RecipeIngredients WHERE quantity IS NULL;
SELECT * FROM RecipeIngredients WHERE quantity IS NOT NULL;

-- MIN and MAX
SELECT MIN(preparation_time) AS min_preparation_time from -- Select recipes with WHERE and AND
SELECT * FROM Recipes WHERE preparation_time > 30 AND preparation_time < 60;

-- Joins
SELECT Recipes.recipe_name, Ingredients.ingredient_name, RecipeIngredients.quantity
FROM Recipes
JOIN RecipeIngredients ON Recipes.recipe_id = RecipeIngredients.recipe_id
JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id;

-- Aggregation functions
SELECT ingredient_name, COUNT(*) AS total_recipes
FROM RecipeIngredients
JOIN Ingredients ON RecipeIngredients.ingredient_id = Ingredients.ingredient_id
GROUP BY ingredient_name
HAVING total_recipes > 1;

-- Subquery
SELECT recipe_name
FROM Recipes
WHERE recipe_id IN (SELECT recipe_id FROM RecipeIngredients WHERE ingredient_id = 1);

-- UNION and UNION ALL
SELECT recipe_id, recipe_name FROM Recipes WHERE preparation_time < 30
UNION ALL
SELECT recipe_id, recipe_name FROM Recipes WHERE preparation_time >= 30;

-- ORDER BY
SELECT * FROM Recipes ORDER BY preparation_time DESC;

-- LIKE and wildcards
SELECT * FROM Ingredients WHERE ingredient_name LIKE '%Chocolate%';

-- NULL and NOT NULL
SELECT * FROM RecipeIngredients WHERE quantity IS NULL;
SELECT * FROM RecipeIngredients WHERE quantity IS NOT NULL;

-- MIN and MAX
SELECT MIN(preparation_time) AS min_preparation_time from Recipe;
select MAX(preparation_time) AS max_preparation_time FROM Recipe;

-- EXISTS
SELECT recipe_name FROM Recipes WHERE EXISTS (SELECT 1 FROM RecipeIngredients WHERE recipe_id = Recipes.recipe_id);

-- ALTER TABLE
ALTER TABLE Recipes ADD COLUMN difficulty ENUM('Easy', 'Medium', 'Hard');

select MAX(preparation_time) AS max_preparation_time FROM Recipe;

-- EXISTS
SELECT Recipe_name FROM Recipe WHERE EXISTS (SELECT 1 FROM RecipeIngredients WHERE Recipe_id = Recipe.Recipe_id);

-- ALTER TABLE
ALTER TABLE Recipe ADD COLUMN difficulty ENUM('Easy', 'Medium', 'Hard');

