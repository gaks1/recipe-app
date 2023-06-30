require 'rails_helper'

RSpec.describe 'Recipe index', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'raihan1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    @recipe = Recipe.includes(:recipe_foods, :user).where(public: true).order(created_at: :desc).first
    visit public_recipes_path
  end

  it 'Displays the name of the Recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'Displays the author of the recipe' do
    expect(page).to have_content(@recipe.user.name)
  end
end
