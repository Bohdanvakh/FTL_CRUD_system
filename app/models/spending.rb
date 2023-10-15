class Spending < ApplicationRecord

  validates :amount, presence: true, numericality: { only_integer: false }
end
