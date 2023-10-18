class SpendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_spending, only: [:show, :edit, :update, :destroy]

  has_scope :by_category
  has_scope :by_amount, using: %i[min max], type: :hash

  def index
    @user_spendings = apply_scopes(Spending).includes(:category).all
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
    if @spending.update(spending_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @spending.destroy

    redirect_to :root
  end

  private

  def find_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:amount, :description, :user_id, :category_id)
  end
end
