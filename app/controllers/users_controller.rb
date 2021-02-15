class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      cookies.signed[:jwt] = { value: token, httponly: true, expires: 1.week.from_now }
      render json: { user: @user, token: token }
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
