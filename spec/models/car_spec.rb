require 'rails_helper'
require 'database_cleaner'

RSpec.describe Car, type: :model do
    before :each do
      @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                          password: '123456', password_confirmation: '123456')
      @car = Car.create(model: 'Porsche', horsepower: '456', range:'567', price: '34000', category: 'electric', description: 'This is an electric car')
      @appointment = Appointment.create(user_id: @user.id, car_id: @car.id, date: '2021-05-05T00:00')
      @picture = Picture.create(image: '', category: 'profile', car_id: @car.id)
    end
  
    it { should have_many(:appointments) }
    it { should have_many(:pictures) }
  
    it 'returns appointment created for a test drive' do
      expect(@car.appointments.first).to eql(@appointment)
    end

    it 'returns picture associated with car' do
        expect(@car.pictures.first).to eql(@picture)
    end
  end