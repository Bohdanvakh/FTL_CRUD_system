class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spendings
  has_many :categories, through: :spendings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
