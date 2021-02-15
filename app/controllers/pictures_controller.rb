class PicturesController < ApplicationController
  def create
    picture = Picture.create(picture_params)
    if picture.save
      render json: picture, status: :created
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:car_id, :image)
  end
end
