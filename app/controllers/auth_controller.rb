class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token_and_cookie(@user.id)
      render json: { user: @user }
    else
      render json: { error: 'Invalid username or password' }, status: 404
    end
  end

  def logout
    cookies.delete(:jwt)
  end
end
