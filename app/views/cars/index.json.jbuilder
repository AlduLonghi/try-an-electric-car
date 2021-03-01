json.data do
  json.array! @cars.each do |car|
    json.id car.id
    json.model car.model
    json.description car.description
    json.profPic car.pictures.each do |pic|
      json.url pic.image_url if pic.category == 'profile'
    end
  end
end
