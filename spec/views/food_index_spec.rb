require 'rails_helper'

RSpec.describe 'Food index', type: :feature do
  include Devise::Test::IntegrationHelpers # include Devise test helpers

  before(:each) do
    @user1 = User.create!(name: 'raihan', email: '1@gmail.com', password: '123456', confirmed_at: Time.now)

    @food1 = Food.create!(name: 'Apple', measurement_unit: 'piece', price: 10, quantity: 1, user: @user1)
  end

  it 'should have a table with food' do
    login_as(@user1) # Sign in the user
    visit '/foods'
    expect(page).to have_content('Add food')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('piece')
    expect(page).to have_content('Unit Price')
    expect(page).to have_content('10.0')
  end

  it 'when clicks delete we go to food page and delete there' do
    login_as(@user1) # Sign in the user
    visit '/foods'
    click_on 'delete'
    expect(page).to have_content('Food was successfully destroyed.')
  end

  it 'when clicks Add food it takes me to a form and a food is successfully added' do
    login_as(@user1) # Sign in the user
    visit '/foods'
    click_on 'Add food'
    expect(page).to have_content('New food')
    fill_in 'Name', with: 'Banana'
    fill_in 'Measurement unit', with: 'piece'
    fill_in 'Price', with: '15'
    fill_in 'Quantity', with: '1'
    click_on 'Submit'
    expect(page).to have_content('Food was successfully created.')
  end
end
