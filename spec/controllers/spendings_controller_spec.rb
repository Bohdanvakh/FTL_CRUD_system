require "rails_helper"

RSpec.describe 'Spending', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe 'allows a user to create a new spending' do
    it 'creates a spending' do
      spendings_params = { amount: 100, description: 'New spending description', user_id: user.id, category_id: category.id }

      post '/spendings', params: { spending: spendings_params }

      expect(Spending.last.amount).to eq("100")
    end
  end

  describe 'allows a user to read a spending' do
    it 'shows a spending' do
      @spending = FactoryBot.create(:spending, user: user, category: category)

      get "/spendings/#{@spending.id}"

      expect(response).to have_http_status(:success)
      expect(response.body).to include(@spending.amount.to_s)
    end
  end

  describe 'allow a user to edit a spending' do
    it 'edit a spending' do
      @spending = FactoryBot.create(:spending, user: user, category: category)

      updated_amount = "200"
      updated_description = 'Lorem'

      patch "/spendings/#{@spending.id}", params: { spending: { amount: updated_amount, description: updated_description } }

      @spending.reload

      expect(@spending.amount).to eq(updated_amount)
      expect(@spending.description).to eq(updated_description)
    end
  end

  describe 'allow a user to delete a spending' do
    it 'delete a spending' do
      @spending = FactoryBot.create(:spending, user: user, category: category)

      expect {delete "/spendings/#{@spending.id}"}.to change(Spending, :count).by(-1)
      expect(Spending.find_by(id: @spending.id)).to be_nil
    end
  end
end
