require 'rails_helper'

RSpec.describe 'Log in session', type: :feature do
  before :each do
    User.create(email: 'test@gmail.com', password: '123456')
    visit new_user_session_path
  end

  describe 'Log in users' do
    it 'I can see the Forgot your password?' do
      expect(page).to have_content('Forgot your password?')
    end

    it 'When I click the login button without filling any data, I get the error message Invalid Email or password' do
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'when I fill in wrong email address I get the error message, Invalid Email or password.' do
      fill_in 'Email', with: 't@gmail.com'
      click_button 'Log In'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
