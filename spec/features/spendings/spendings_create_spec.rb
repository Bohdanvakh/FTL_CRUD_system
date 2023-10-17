require "rails_helper"

RSpec.feature 'Spendings create' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    login_as(user)
  end

  scenario 'allows a user to create a spending' do
    @category =  FactoryBot.create(:category, name: 'Traveling')

    visit root_path

    expect(page).to have_content('Total amount')

    fill_in 'amount', with: 100
    fill_in 'description', with: 'Lorem ipsum dolor sit amet'
    select @category.name, from: 'category_id'
    click_button 'Add Spending'

    expect(page).to have_text('Spending was successfully created')
  end
end
