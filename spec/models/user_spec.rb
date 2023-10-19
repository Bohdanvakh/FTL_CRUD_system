require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with an email and password' do
    user = User.new(email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil, password: 'password')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(email: 'user@example.com', password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'has many spendings' do
    user = User.reflect_on_association(:spendings)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many categories through spendings' do
    user = User.reflect_on_association(:categories)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many authors (shares)' do
    user = User.reflect_on_association(:authors)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many recipients (shares)' do
    user = User.reflect_on_association(:recipients)
    expect(user.macro).to eq(:has_many)
  end
end
