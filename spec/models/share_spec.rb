require 'rails_helper'

RSpec.describe Share, type: :model do
  it 'is valid with an author and recipient' do
    user1 = User.create(email: 'user1@example.com', password: 'password')
    user2 = User.create(email: 'user2@example.com', password: 'password')
    share = Share.new(author: user1, recipient: user2)
    expect(share).to be_valid
  end

  it 'is invalid without an author' do
    user = User.create(email: 'user@example.com', password: 'password')
    share = Share.new(recipient: user)
    share.valid?
    expect(share.errors[:author_id]).to include("can't be blank")
  end

  it 'is invalid without a recipient' do
    user = User.create(email: 'user@example.com', password: 'password')
    share = Share.new(author: user)
    share.valid?
    expect(share.errors[:recipient_id]).to include("can't be blank")
  end

  it 'belongs to an author' do
    share = Share.reflect_on_association(:author)
    expect(share.macro).to eq(:belongs_to)
  end

  it 'belongs to a recipient' do
    share = Share.reflect_on_association(:recipient)
    expect(share.macro).to eq(:belongs_to)
  end
end
