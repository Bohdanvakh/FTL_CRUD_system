module UsersHelper
  def total_spending_amount(user)
    user&.spendings.sum(:amount)
  end
end
