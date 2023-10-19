class SpendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_spending, only: [:show, :edit, :update, :destroy]

  has_scope :for_user
  has_scope :by_category
  has_scope :by_amount, using: %i[min max], type: :hash

  def index
    @user_spendings = apply_scopes(Spending.for_user(current_user)).includes(:category).all
  end

  def new
    @spending = Spending.new
    @categories = Category.all
  end

  def create
    @spending = Spending.new(spending_params)
    if @spending.save
      redirect_to root_path, notice: 'Spending was successfully created'
    else
      redirect_to root_path, alert: 'Spending was not created'
    end
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    if current_user == @spending.user
      if @spending.update(spending_params)
        redirect_to :root
      else
        render :edit
      end
    else
      redirect_to :root, alert: "You don't have permission to edit this spending."
    end
  end

  def destroy
    if current_user == @spending.user
      @spending.destroy
      redirect_to :root
    else
      redirect_to :root, alert: "You don't have permission to delete this spending."
    end
  end

  private

  def find_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:amount, :description, :user_id, :category_id)
  end
end
