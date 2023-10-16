class SpendingsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @spending = Spending.new
    @categories = Category.all
  end

  def create
    @spending = Spending.new(spending_params)
    if @spending.save
      redirect_to root_path, notice: 'Spending was successfully created'
    else
      flash.now[:alert] = 'Spending was not created'
    end
  end

  def show
    @spending = Spending.find(params[:id])
  end

  def edit
    @spending = Spending.find(params[:id])
    @categories = Category.all
  end

  def update
    @spending = Spending.find(params[:id])
    if @spending.update(spending_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    @spending.destroy

    redirect_to :root
  end

  private

  def spending_params
    binding.pry
    params.require(:spending).permit(:amount, :description, :user_id, :category_id)
  end
end
