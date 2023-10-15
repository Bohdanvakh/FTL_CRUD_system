class Category < ApplicationRecord
  has_many :spendings
  has_many :users, through: :spendings

  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/ }
end
