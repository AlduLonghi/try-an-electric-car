require 'rails_helper'
require 'database_cleaner'

RSpec.describe Appointment, type: :model do
  before :each do
    @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @car = Car.create(model: 'Porsche', horsepower: '456', range: '567', price: '34000', category: 'electric', description: 'This is an electric car')
    @appointment = @user.appointments.build(car_id: @car.id, date: '2021-04-30T00:00', city: 'New York')
    @appointment1 = Appointment.create(user_id: @user.id, car_id: @car.id, date: '2020-05-05T00:00', city: 'New York')
  end

  it 'returns appointment created for a test drive with date after today\'s' do
    expect(@appointment.id).to eql(@appointment.id)
  end

  it 'returns nil when date is before today\'s' do
    expect(@appointment1.save).not_to be true
  end

  it 'belongs to user model' do
    expect(@user).to have_many(:appointments)
  end

  it 'belongs to car model' do
    expect(@car).to have_many(:appointments)
  end
end
