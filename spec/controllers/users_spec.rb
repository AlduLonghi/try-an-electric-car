require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST request' do
    it 'creates a new user succesfully' do
      post '/users', params: { name: 'Aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456' }
      expect(response).to have_http_status(:success)
    end

    it 'includes jwt token in response when user is created' do
      post '/users', params: { name: 'Enzo Tomas', email: 'enzo@gmail.com', password: '123456', password_confirmation: '123456' }
      request_response = JSON.parse(response.body)
      expect(request_response.keys).to match_array(%w[token user])
    end

    it 'has a http status of 500 when there are validation errors' do
      post '/users', params: { name: 'Aldu', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456' }
      expect(response).to have_http_status(500)
    end
  end

  describe 'GET user request' do
    it 'returns current user information' do
      post '/users', params: { name: 'Enzo Tomas', email: 'enzo@gmail.com', password: '123456', password_confirmation: '123456' }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      get '/', headers: { 'Authorization': "bearer #{token}", 'Content-Type': 'application/json' }
      request_response = JSON.parse(response.body)
      expect(request_response.keys).to match_array(%w[created_at email id name password_digest updated_at])
    end
  end
end
