require "rails_helper"

RSpec.feature 'User registration' do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'allows a user to register' do
    it 'returns current path /users' do
      visit new_user_registration_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      click_button 'Sign up'

      expect(page).to have_current_path('/users')
    end
  end

  describe 'requires a valid email' do
    it 'returns validation message that email is invalid' do
      visit new_user_registration_path
      fill_in 'Email', with: 'invalid_email'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'

      expect(page).to have_content('Email is invalid')
    end
  end

  describe 'requires a password' do
    it 'returns validation message that password is invalid' do
      visit new_user_registration_path
      fill_in 'Email', with: 'newuser@gmail.com'
      click_button 'Sign up'

      expect(page).to have_content("Password can't be blank")
    end
  end

  describe 'requires a valid password' do
    it 'returns validation message that password is invalid' do
      visit new_user_registration_path
      fill_in 'Email', with: 'newuser@gmail.com'
      fill_in 'Password', with: 'pass'
      fill_in 'Password confirmation', with: 'pass'
      click_button 'Sign up'

      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    it 'returns validation message that password is invalid' do
      visit new_user_registration_path
      fill_in 'Email', with: 'newuser@gmail.com'
      fill_in 'Password', with: 'password123!'
      fill_in 'Password confirmation', with: 'invalid_password'
      click_button 'Sign up'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
