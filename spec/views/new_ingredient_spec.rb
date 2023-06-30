require 'rails_helper'

RSpec.describe 'Shopping list', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user1 = User.create!(name: 'raihan', email: 'b@gmail.com', password: '123456', confirmed_at: Time.now)

    @food1 = Food.create!(name: 'Apple', measurement_unit: 'piece', price: 10, quantity: 1, user: @user1)
    @food2 = Food.create!(name: 'Banana', measurement_unit: 'piece', price: 15, quantity: 1, user: @user1)

    @recipe1 = Recipe.create!(name: 'Apple Pie', preparation_time: 30, cooking_time: 60,
                              description: 'Lorem ipsum dolor sit amet', public: true, user: @user1)

    @recipefood1 = RecipeFood.create!(quantity: 2, recipe: @recipe1, food: @food1)
    @recipefood1 = RecipeFood.create!(quantity: 3, recipe: @recipe1, food: @food2)
    login_as(@user1)
    visit recipe_path(@recipe1)
  end

  it 'should have a link to add new ingredient' do
    expect(page).to have_content('Add ingredients')
    click_on 'Add ingredients'
    expect(page).to have_content('New Ingredient')
    expect(page).to have_content('Name')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Price')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Recipe quantity')
  end

  it 'add new ingredient successfully' do
    click_on 'Add ingredients'
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'piece'
    fill_in 'Price', with: '10'
    fill_in 'Quantity', with: '1'
    fill_in 'food[recipe_foods_attributes][0][quantity]', with: '2'
    click_on 'Submit'
    expect(page).to have_content('Your Recipe is created successfully 🎉')
  end
end
