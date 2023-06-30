require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @u = User.new(name: 'raihan', email: 'raihan@test.com', password: '123456')
    @r = @u.recipes.new(name: 'Recipe Title', preparation_time: 2, cooking_time: 4,
                        description: 'This is a dummy recipe content.', public: nil, user_id: @u.id)
    @f = @u.foods.new(name: 'Banana', measurement_unit: 'un', price: 1, user_id: @u.id)
    @rf = @r.recipe_foods.new(quantity: 2, food_id: @f.id, recipe_id: @r.id)
    @rf.food = @f
  end
  it 'should have the correct food' do
    expect(@rf.food).to be @f
  end

  it 'should have the correct recipe' do
    expect(@rf.recipe).to be @r
  end

  it 'should have the correct quantity' do
    expect(@rf.quantity).to be 2
  end
end
