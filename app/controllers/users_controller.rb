class UsersController < ApplicationController
  before_action :authenticate_user!

  has_scope :by_category
  has_scope :by_amount, using: %i[min max], type: :hash


  def index
    @user = current_user
    @categories = Category.all

    @user_spendings = apply_scopes(Spending).includes(:category).all
  end
end
