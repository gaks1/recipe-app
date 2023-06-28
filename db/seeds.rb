
# Seed data for users table
User.create(name: "John Doe")
User.create(name: "Jane Smith")

# Seed data for foods table
Food.create(name: "Apple", measurement_unit: "piece", price: 10, quantity: 1, user: User.first)
Food.create(name: "Banana", measurement_unit: "piece", price: 15, quantity: 1, user: User.first)
Food.create(name: "Chicken", measurement_unit: "kg", price: 20, quantity: 5, user: User.second)

# Seed data for recipes table
Recipe.create(name: "Apple Pie", preparation_time: 30, cooking_time: 60, description: "Delicious apple pie recipe", public: true, user: User.first)
Recipe.create(name: "Banana Bread", preparation_time: 45, cooking_time: 50, description: "Yummy banana bread recipe", public: true, user: User.second)

# Seed data for recipe_foods table
RecipeFood.create(quantity: 2, recipe: Recipe.first, food: Food.first)
RecipeFood.create(quantity: 3, recipe: Recipe.first, food: Food.second)
RecipeFood.create(quantity: 4, recipe: Recipe.second, food: Food.second)
RecipeFood.create(quantity: 2, recipe: Recipe.second, food: Food.third)

first_user = User.create(name: 'Raihan')
second_user = User.create(name: 'Isaac')

first_recipe = Recipe.create(name: 'Recipe 1', preparation_time: 1, cooking_time: 2, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nibh massa, suscipit tristique risus ac, pellentesque aliquet leo. Maecenas maximus vestibulum purus id dictum. Nullam laoreet lacus turpis. Fusce eget nulla sit amet turpis blandit laoreet. Vestibulum rhoncus velit at scelerisque interdum. Proin at nisl semper, maximus enim et, finibus tellus. Duis nec nunc non lorem dictum euismod quis ac dolor. Sed tempus elementum elit, sed rhoncus neque interdum ut. Mauris nisl justo, condimentum in porttitor vel, maximus nec purus. In nec augue lectus.', public: true, user: first_user)

second_recipe = Recipe.create(name: 'Recipe 2', preparation_time: 1, cooking_time: 2, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nibh massa, suscipit tristique risus ac, pellentesque aliquet leo. Maecenas maximus vestibulum purus id dictum. Nullam laoreet lacus turpis. Fusce eget nulla sit amet turpis blandit laoreet. Vestibulum rhoncus velit at scelerisque interdum. Proin at nisl semper, maximus enim et, finibus tellus. Duis nec nunc non lorem dictum euismod quis ac dolor. Sed tempus elementum elit, sed rhoncus neque interdum ut. Mauris nisl justo, condimentum in porttitor vel, maximus nec purus. In nec augue lectus.', public: true, user: second_user)

