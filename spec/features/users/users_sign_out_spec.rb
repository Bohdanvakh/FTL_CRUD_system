require "rails_helper"

RSpec.feature 'User sign out' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  scenario 'user sign out' do
    visit '/'

    click_button "Sign out"

    expect(page).to have_current_path("/users/sign_in")
  end
end
