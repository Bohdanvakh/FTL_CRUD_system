class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spendings
  has_many :categories, through: :spendings

  has_many :authors, class_name: 'Shares', foreign_key: :user_id
  has_many :recipient, class_name: 'Shares', foreign_key: :shared_user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
