class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    puts params[:password]
    if @user&.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: { error: 'Invalid username or password' }, status: 404
    end
  end

  def destroy
    cookies.delete(:jwt)
  end
end
