json.data do
  json.array! @cars.each do |car|
    json.id car.id
    json.model car.model
    json.profPic car.pictures.each do |pic|
      json.url pic.image_url if pic.category == 'profile'
    end
  end
end
