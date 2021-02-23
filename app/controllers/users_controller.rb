class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :ok
    else
      render json: { errors: @user.errors }, status: 401
    end
  end

  def show
    render json: @current_user
  end

  private

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
