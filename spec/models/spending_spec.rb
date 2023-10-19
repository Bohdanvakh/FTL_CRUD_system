require 'rails_helper'

RSpec.describe Spending, type: :model do
  it 'is valid with an amount' do
    user = User.create(email: 'user@example.com', password: 'password')
    category = Category.create(name: 'Food')
    spending = Spending.new(user: user, category: category, amount: 100)
    expect(spending).to be_valid
  end

  it 'is invalid without an amount' do
    user = User.create(email: 'user@example.com', password: 'password')
    category = Category.create(name: 'Food')
    spending = Spending.new(user: user, category: category, amount: nil)
    spending.valid?
    expect(spending.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid if amount is not a number' do
    user = User.create(email: 'user@example.com', password: 'password')
    category = Category.create(name: 'Food')
    spending = Spending.new(user: user, category: category, amount: 'invalid')
    spending.valid?
    expect(spending.errors[:amount]).to include("is not a number")
  end

  it 'belongs to a user' do
    spending = Spending.reflect_on_association(:user)
    expect(spending.macro).to eq(:belongs_to)
  end

  it 'belongs to a category' do
    spending = Spending.reflect_on_association(:category)
    expect(spending.macro).to eq(:belongs_to)
  end
end
