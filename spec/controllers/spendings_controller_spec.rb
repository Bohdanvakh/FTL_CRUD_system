require "rails_helper"

RSpec.describe 'Spending', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:category_clothing) { create(:category, name: 'Clothing') }

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

  describe 'allow a user to filter spendings' do
    before do
      @spending = FactoryBot.create(:spending, user: user, category: category)
      @spending_clothing = FactoryBot.create(:spending, user: user, category: category_clothing)
    end

    it 'filter a spendings by category' do
      get "/spendings?by_category=#{category_clothing.id}"

      expect(response).to have_http_status(:success)
    end

    it 'filter a spendings by amount' do
      min_value = 10
      max_value = 100

      get "/spendings?&by_amount%5Bmin%5D=#{min_value}&by_amount%5Bmax%5D=#{max_value}"

      expect(response).to have_http_status(:success)
    end

    it 'filter a spendings by amount and category' do
      min_value = 10
      max_value = 100

      get "/spendings?by_category=#{category_clothing.id}?&by_amount%5Bmin%5D=#{min_value}&by_amount%5Bmax%5D=#{max_value}"

      expect(response).to have_http_status(:success)
    end
  end
end
