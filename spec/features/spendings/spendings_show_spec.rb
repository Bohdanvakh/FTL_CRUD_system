require "rails_helper"

RSpec.feature 'Spendings show' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    login_as(user)
  end

  scenario 'allows a user to see a spending' do
    @spending = FactoryBot.create(:spending, user: user, category: category)

    visit spending_path(@spending)

    expect(page).to have_current_path(spending_path(@spending))
    expect(page).to have_content('Amount')
    expect(page).to have_content('Description')
    expect(page).to have_content('Category')
  end
end
