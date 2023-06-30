require 'rails_helper'

RSpec.describe 'Recipe show', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'raihan1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit recipe_path(Recipe.first.id)
  end

  it 'Displays the preparation time' do
    expect(page).to have_content('Preparation time:')
  end

  it 'Displays the Cooking time' do
    expect(page).to have_content('Cooking time:')
  end

  it 'Displays the description' do
    expect(page).to have_content('Step to follow:')
  end

  it 'Displays the ingredients' do
    Recipe.find_by_id(Recipe.first.id).recipe_foods.each { |f| expect(page).to have_content(f.quantity) }
  end
end
