require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  before :each do
    @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                        password: '123456', password_confirmation: '123456')
  end

  describe 'POST request' do
    it 'returns user if it exists' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      expect(request_response.keys).to match_array(%w[user token])
    end

    it 'has a http status of 404 when user is not found' do
      post '/login', params: { email: 'cecilia@gmail.com', password: 123_456 }
      expect(response).to have_http_status(404)
    end
  end
end
