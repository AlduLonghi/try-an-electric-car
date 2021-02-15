class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token_and_cookie(@user.id)
      render json: { user: @user }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  private

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
