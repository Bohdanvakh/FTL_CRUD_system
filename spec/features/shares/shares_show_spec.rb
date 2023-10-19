require "rails_helper"

RSpec.feature 'Spendings create' do
  let(:user) { create(:user) }
  let(:second_user) { create(:user, email: 'user@example.com') }
  let(:category) { create(:category) }
  let(:spending) { create(:spending) }
  let(:share) { create(:share, author: user, recipient: second_user) }

  before do
    login_as(second_user)

    @spending = create(:spending, user: user, category: category )
    @share = create(:share, author: user, recipient: second_user)
  end

  scenario 'show list of shares' do

    visit '/shares'

    expect(page).to have_content('Shares')
    expect(page).to have_content(user.email)
    expect(page).to have_content(@spending.amount)
    expect(page).to have_content(@spending.category.name)
  end
end
