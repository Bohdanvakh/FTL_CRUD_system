require "rails_helper"

RSpec.describe 'Shares', type: :request do
  let(:user) { create(:user) }

  before do
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get '/shares/new'
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new share' do
      recipient = create(:user, email: 'johndoe@gmail.com')
      share_params = { share: { author_id: user.id, recipient_id: recipient.email } }

      expect {post '/shares', params: share_params}.to change(Share, :count).by(1)

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Share was successfully created')
    end

    it 'fails to create a new share with invalid parameters' do
      share_params = { share: { author_id: user.id, recipient_id: 'invalid-email' } }

      post '/shares', params: share_params

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq('Share could not be created')
    end
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get '/shares'
      expect(response).to be_successful
    end
  end
end
