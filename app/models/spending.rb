class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true, numericality: { only_integer: false }
end
