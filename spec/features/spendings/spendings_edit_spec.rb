require "rails_helper"

RSpec.feature 'Spendings edit' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    login_as(user)
  end

  scenario 'allows a user to edit a spending' do
    @category =  FactoryBot.create(:category, name: 'Traveling')
    @spending = FactoryBot.create(:spending, user: user, category: @category)

    visit edit_spending_path(@spending)

    expect(page).to have_current_path(edit_spending_path(@spending))

    fill_in 'amount', with: 1000
    fill_in 'description', with: 'Lorem ipsum dolor'
    select @category.name, from: 'category'

    click_button 'Edit Spending'

    expect(@spending.reload.amount).to eq("1000")
    expect(page).to have_current_path('/')
  end
end
