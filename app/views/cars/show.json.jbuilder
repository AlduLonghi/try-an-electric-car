json.data do
  json.id @car.id
  json.category @car.category
  json.model @car.model
  json.horsepower @car.horsepower
  json.range @car.range
  json.price @car.price
  json.description @car.description
  json.profPic @car.pictures.each do |pic|
    json.url pic.image_url if pic.category == 'profile'
  end
  json.generalPics @car.pictures.each do |pic|
    json.url pic.image_url if pic.category == 'general'
  end
end
