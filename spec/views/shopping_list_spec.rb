require 'rails_helper'

RSpec.describe 'Shopping list', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user1 = User.create!(name: 'raihan', email: 'h@gmail.com', password: '123456', confirmed_at: Time.now)

    @food1 = Food.create!(name: 'Apple', measurement_unit: 'piece', price: 10, quantity: 1, user: @user1)
    @food2 = Food.create!(name: 'Banana', measurement_unit: 'piece', price: 15, quantity: 1, user: @user1)

    @recipe1 = Recipe.create!(name: 'Apple Pie', preparation_time: 30, cooking_time: 60,
                              description: 'Lorem ipsum dolor sit amet', public: true, user: @user1)

    @recipefood1 = RecipeFood.create!(quantity: 2, recipe: @recipe1, food: @food1)
    @recipefood1 = RecipeFood.create!(quantity: 3, recipe: @recipe1, food: @food2)
    login_as(@user1)
    visit recipe_path(@recipe1)
  end

  it 'should have a link to general shopping list' do
    expect(page).to have_content('Generate shopping list')
    click_on 'Generate shopping list'
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Amount of food items to buy:')
    expect(page).to have_content('Total value of food needed:')
  end
end
