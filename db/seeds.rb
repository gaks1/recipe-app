# Seed data for users table
User.create(name: "John Doe")
User.create(name: "Jane Smith")

# Seed data for foods table
Food.create(name: "Apple", measurement_unit: "piece", price: 0.99, quantity: 10, user: User.first)
Food.create(name: "Banana", measurement_unit: "piece", price: 0.75, quantity: 15, user: User.first)
Food.create(name: "Chicken", measurement_unit: "kg", price: 8.99, quantity: 5, user: User.second)

# Seed data for recipes table
Recipe.create(name: "Apple Pie", preparation_time: 30, cooking_time: 60, description: "Delicious apple pie recipe", public: true, user: User.first)
Recipe.create(name: "Banana Bread", preparation_time: 45, cooking_time: 50, description: "Yummy banana bread recipe", public: true, user: User.second)

# Seed data for recipe_foods table
RecipeFood.create(quantity: 2, recipe: Recipe.first, food: Food.first)
RecipeFood.create(quantity: 3, recipe: Recipe.first, food: Food.second)
RecipeFood.create(quantity: 4, recipe: Recipe.second, food: Food.second)
RecipeFood.create(quantity: 2, recipe: Recipe.second, food: Food.third)
