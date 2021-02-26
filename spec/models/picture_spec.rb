require 'rails_helper'
require 'database_cleaner'

RSpec.describe Picture, type: :model do
  before :each do
    @car = Car.create(model: 'Porsche', horsepower: '456', range: '567', price: '34000', category: 'electric', description: 'This is an electric car')
    @picture = Picture.create(image: '', car_id: @car.id, category: 'profile')
  end

  it { should belong_to(:car) }

  it 'returns picture created' do
    expect(@picture.id).to eql(@picture.id)
  end
end
