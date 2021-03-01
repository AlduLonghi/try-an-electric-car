require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  before :each do
    @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @car = Car.create(model: 'Porsche', horsepower: '456', range: '567',
                      price: '34000', category: 'electric',
                      description: 'This is an electric car')
  end

  describe 'GET request' do
    it 'returns all cars' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      get '/cars', headers: { 'Authorization': "bearer #{token}" }
      expect(response).to render_template(:index)
    end

    it 'returns specific car' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      get "/cars/#{@car.id}", headers: { 'Authorization': "bearer #{token}" }
      expect(response).to render_template(:show)
    end
  end

  describe 'POST request' do
    it 'succesfully creates a car' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      post '/cars', headers: { 'Authorization': "bearer #{token}" },
                    params: { model: 'Porsche', horsepower: '456', range: '567',
                              price: '34000', category: 'electric',
                              description: 'This is an electric car' }
      expect(response).to have_http_status(:created)
    end
  end
end
