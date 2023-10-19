class Share < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :author_id, presence: true
  validates :recipient_id, presence: true
end
