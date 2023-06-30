require 'rails_helper'

RSpec.describe 'Recipe index', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'raihan1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit recipes_path
  end

  it 'Displays the title of the Recipe page' do
    expect(page).to have_content('Recipes')
  end

  it 'Displays a button to add new recipe' do
    expect(page).to have_content('Add Recipe')
  end
end
