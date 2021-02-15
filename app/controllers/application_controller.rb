class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  SECRET_KEY = Rails.application.secrets.secret_base_key.to_s

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def authorized?
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  private

  def decoded_token
    jwt = cookies.signed[:jwt]
    JWT.decode(jwt, SECRET_KEY, true, algorithm: 'HS256')
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end
end
