require "rails_helper"

RSpec.feature 'Spendings create' do
  let(:user) { create(:user) }
  let(:second_user) { create(:user, email: 'user@example.com') }
  let(:spending) { create(:spending) }

  before do
    login_as(user)
  end

  scenario 'shares list of spendings' do

    visit root_path

    expect(page).to have_content('Share your list of spendings with:')

    fill_in 'recipient_id', with: second_user.email
    click_button 'Share list'

    expect(page).to have_text('Share was successfully created')
  end

  scenario 'does not share list of spendings' do
    visit root_path

    expect(page).to have_content('Share your list of spendings with:')

    fill_in 'recipient_id', with: 'invalid@gmail.com'
    click_button 'Share list'

    expect(page).to have_text('Share could not be created')
  end
end
