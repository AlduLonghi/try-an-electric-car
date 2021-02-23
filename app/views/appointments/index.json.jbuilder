json.data do
  json.array! @appointments.each do |app|
    json.id app.id
    json.model Car.find_by(id: app.car_id).model
    json.datetime app.date.to_s.to_datetime
    json.city app.city
  end
end
