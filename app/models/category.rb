class Category < ApplicationRecord

  validates :name, presence :true, format: { with: /\A[a-zA-Z ]+\z/ }
end
