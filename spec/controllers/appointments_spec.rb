require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  before :each do
    @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @car = Car.create(model: 'Porsche', horsepower: '456', range: '567',
                      price: '34000', category: 'electric',
                      description: 'This is an electric car')
    @appointment = Appointment.create(user_id: @user.id, car_id: @car.id, date: '2021-05-05T00:00')
  end

  describe 'GET request' do
    it 'returns all appointments of current user' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      get '/appointments', headers: { 'Authorization': "bearer #{token}" }
      expect(response).to render_template(:index)
    end
  end

  describe 'POST request' do
    it 'creates a new appointment' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      post '/appointments',
           headers: { 'Authorization': "bearer #{token}" },
           params: { appointment: { date: '2021-05-05T00:00', city: 'New York', car_id: @car.id, user_id: nil } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE request' do
    it 'deletes an appointment' do
      post '/login', params: { email: @user.email, password: @user.password }
      request_response = JSON.parse(response.body)
      token = request_response['token']
      delete "/appointments/#{@appointment.id}",
             headers: { 'Authorization': "bearer #{token}" }
      expect(response).to have_http_status(:ok)
    end
  end
end
