require "rails_helper"

RSpec.feature 'Filter by category' do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    login_as(user)

    @category = create(:category, name: "Traveling")
    @another_category = create(:category, name: "Clothing")

    @spending = create(:spending, amount: 300, description: 'This description should not be in responce body after clicking Filter button', user: user, category: @category)
    @another_spending = create(:spending, amount: 100, description: 'This description should be in responce body', user: user, category: @another_category)
    @another_spending_2 = create(:spending, amount: 300, description: 'This description should be in responce body', user: user, category: @another_category)
  end

  scenario 'filter spendings by category' do
    visit root_path

    expect(page).to have_content('Select')
    expect(page).to have_content('Min Amount')
    expect(page).to have_content('Max Amount')


    select @another_category.name, from: 'filter_category'

    click_button 'Filter'

    expect(page).to have_content(@another_category.name)
    expect(page).to have_content(@another_spending.description)
    expect(page).to_not have_content(@spending.description)
  end

  scenario 'filter spendings by amount' do
    visit root_path

    expect(page).to have_content('Select')
    expect(page).to have_content('Min Amount')
    expect(page).to have_content('Max Amount')

    fill_in "by_amount[min]",	with: "99"
    fill_in "by_amount[max]",	with: "100"

    click_button 'Filter'

    expect(page).to have_content(@another_spending.amount.to_s)
    expect(page).to_not have_content(@spending.amount.to_s)
  end

  scenario 'filter spendings by amount and category' do
    visit root_path

    expect(page).to have_content('Select')
    expect(page).to have_content('Min Amount')
    expect(page).to have_content('Max Amount')

    select @another_category.name, from: 'filter_category'
    fill_in "by_amount[min]",	with: "99"
    fill_in "by_amount[max]",	with: "100"

    click_button 'Filter'

    expect(page).to have_content(@another_spending.amount)
    expect(page).to_not have_content(@another_spending_2.amount)
    expect(page).to_not have_content(@spending.amount)
  end
end
