require 'rails_helper'
require 'database_cleaner'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'aldana longhi', email: 'aldulon@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @user1 = User.create(name: 'aldu', email: 'aldulonghi123@gmail.com')
    @user2 = User.create(name: 'enzo', email: 'enzogmail.com',
                         password: '123456', password_confirmation: '123456')
    @user3 = User.create(name: 'enzo', email: 'enzogmail.com',
                         password: '1234', password_confirmation: '123456')
    @appointment = @user.appointments.build(date: '2021-05-05T00:00', car_id:'7', city: 'New York')
  end

  it { should have_many(:appointments) }

  it 'returns created user' do
    expect(@user.id).to eql(@user.id)
  end

  it 'returns nil because user was not created (name validation)' do
    expect(@user1.save).not_to be true
  end

  it 'returns nil because user was not created (email validation)' do
    expect(@user2.save).not_to be true
  end

  it 'returns nil because user was not created (password validation)' do
    expect(@user3.save).not_to be true
  end

  it 'returns appointment created by user' do
    expect(@user.appointments.first).to eql(@appointment)
  end
end
