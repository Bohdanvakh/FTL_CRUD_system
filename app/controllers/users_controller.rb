class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = Category.all
    @user_spendings = Spending.includes(:category).where(user_id: @user.id)
  end
end
