require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/categories/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/categories/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/categories/create'
      expect(response).to have_http_status(:success)
    end
  end
end
