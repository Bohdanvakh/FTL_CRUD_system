require "rails_helper"

RSpec.feature 'Spendings delete' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    login_as(user)
  end

  scenario 'allows a user to delete a spending' do
    @category =  FactoryBot.create(:category, name: 'Traveling')
    @spending = FactoryBot.create(:spending, user: user, category: @category)

    expect(@spending).to_not be_nil

    visit '/'
    click_button 'Delete'

    expect(page).to have_current_path('/')
    expect(Spending.count).to eq(0)
  end
end
