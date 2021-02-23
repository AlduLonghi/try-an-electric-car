class PicturesController < ApplicationController
  def create
    picture = Picture.create(picture_params)
    if picture.save
      render json: picture, status: :created
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end
    
  def destroy
    picture = Picture.find_by(id: params[:id])
    picture.destroy
    render json: 'Succesfully deleted', status: :ok
  end

  private

  def picture_params
    params.permit(:car_id, :image, :category)
  end
end
