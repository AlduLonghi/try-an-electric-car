require 'rails_helper'

RSpec.describe 'Pictures', type: :request do
  before :each do
    @pic = fixture_file_upload('pictures/images.jpeg')
    @car = Car.create(model: 'Porsche', horsepower: '456', range: '567',
                      price: '34000', category: 'electric', description: 'This is an electric car')
  end

  describe 'POST request' do
    it 'creates a new picture succesfully' do
      post '/pictures', params: { image: @pic, category: 'profile',
                                  car_id: @car.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE request' do
    it 'deletes a picture succesfully' do
      post '/pictures', params: { image: @pic, category: 'profile', car_id: @car.id }
      request_response = JSON.parse(response.body)
      pic_id = request_response['id']
      delete "/pictures/#{pic_id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
