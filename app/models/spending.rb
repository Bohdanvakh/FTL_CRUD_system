class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true, numericality: { only_integer: false }

  scope :for_user, ->(user) { where(user_id: user.id) } # use in to return current user spendings
  scope :by_category, ->(category) { where(category_id: category) if category.present? }
  scope :by_amount, -> (min, max) { where('CAST(amount AS DECIMAL) >= ? AND CAST(amount AS DECIMAL) <= ?', min.to_i, max.to_i) if min.present? && max.present? }
end
