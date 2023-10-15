class Category < ApplicationRecord

  validations :name, presence :true, format: { with: /\A[a-zA-Z ]+\z/ }
end
