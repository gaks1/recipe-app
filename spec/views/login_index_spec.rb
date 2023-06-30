require 'rails_helper'

RSpec.describe 'Log in session', type: :feature do
  before :each do
    User.create(password: '123456', email: 'reem@gmail.com', confirmed_at: Time.now)
    visit new_user_session_path
  end

  describe 'index page for list users' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_content('Email')
      expect(page).to have_content('password')
      expect(page).to have_content('Log in')
    end

    it 'It should returen Invalid Email or password error message' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'It should redirect to root path' do
      fill_in 'Email', with: 'raihan1@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page.current_path).to have_content('/')
    end
  end
end
