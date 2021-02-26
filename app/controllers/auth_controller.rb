class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    elsif @user
      render json: { error: 'Invalid password' }, status: 404
    else
      render json: { error: 'You need to create an account' }, status: 404
    end
  end
end
