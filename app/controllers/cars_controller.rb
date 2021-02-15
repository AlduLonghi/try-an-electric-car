class CarsController < ApplicationController
  def create
    car = Car.create(car_params)

    if car.save
      render json: car, status: :created
    else
      render json: car.errors, status: :unprocessable_entity
    end
  end

  def show
    car = Car.find_by(id: params[:id])
    if car
      render json: car
    else
      render json: { error: "Sorry, we couldn't find the item"}, status: 404
    end
  end

  private

  def car_params
    params.require(:car).permit(:horsepower, :range, :price)
  end
end
