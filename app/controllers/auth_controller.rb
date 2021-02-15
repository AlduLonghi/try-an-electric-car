class AuthController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token_and_cookie(@user.id)
      render json: { user: @user }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def destroy
    cookies.delete(:jwt)
  end
end
