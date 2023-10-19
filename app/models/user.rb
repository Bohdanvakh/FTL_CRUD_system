class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spendings
  has_many :categories, through: :spendings

  has_many :authors, class_name: 'Share', foreign_key: :author_id
  has_many :recipients, class_name: 'Share', foreign_key: :recipient_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
