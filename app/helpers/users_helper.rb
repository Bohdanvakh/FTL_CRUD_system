module UsersHelper
  def total_spending_amount(user)
    # user&.spendings.sum(:amount)
    user&.spendings.sum { |spending| spending.amount.to_f }
  end
end
