require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    category = Category.new(name: 'Food')
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a name containing special characters' do
    category = Category.new(name: 'F@od')
    category.valid?
    expect(category.errors[:name]).to include("is invalid")
  end

  it 'has many spendings' do
    category = Category.reflect_on_association(:spendings)
    expect(category.macro).to eq(:has_many)
  end

  it 'has many users through spendings' do
    category = Category.reflect_on_association(:users)
    expect(category.macro).to eq(:has_many)
  end
end
