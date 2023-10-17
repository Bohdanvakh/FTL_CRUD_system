require "rails_helper"

RSpec.feature 'User login' do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'allows a user to sign in' do
    it 'returns current path /users' do
      visit user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      expect(page).to have_current_path('/')
      expect(page).to have_content("List of spendings")
    end
  end

  describe 'requires a valid email' do
    it 'returns validation message that email is invalid' do
      visit user_session_path
      fill_in 'Email', with: 'invalid_email@gmail.com'
      fill_in 'Password', with: 'password123'
      click_button 'Log in'

      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content("Invalid Email or password.")
    end
  end

  describe 'requires a password' do
    it 'returns alert message' do
      visit user_session_path
      fill_in 'Email', with: 'newuser@gmail.com'
      click_button 'Log in'

      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content("Invalid Email or password.")
    end
  end

  describe 'requires a valid password' do
    it 'returns alert message' do
      visit user_session_path
      fill_in 'Email', with: 'newuser@gmail.com'
      fill_in 'Password', with: 'pass'
      click_button 'Log in'

      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
