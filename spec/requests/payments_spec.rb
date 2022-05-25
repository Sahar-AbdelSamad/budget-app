require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/payments/index'
      expect(response).to have_http_status(:success)
    end
  end
end
