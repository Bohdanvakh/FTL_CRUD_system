class SharesController < ApplicationController
  before_action :authenticate_user!

  def index
    @shared_lists = current_user.recipients
    @shared_spendings = Spending.includes(:category, :user).where(user_id: @shared_lists.pluck(:author_id))
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)

    recipient_id = find_user_by_email(share_params[:recipient_id])
    @share.recipient_id = recipient_id if recipient_id

    if @share.save
      redirect_to root_path, notice: 'Share was successfully created'
    else
      redirect_to root_path, alert: 'Share could not be created'
    end
  end

  private

  def share_params
    params.require(:share).permit(:author_id, :recipient_id)
  end

  def find_user_by_email(email)
    recipient  = User.find_by(email: email)
    recipient&.id
  end
end
