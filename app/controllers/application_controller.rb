class ApplicationController < ActionController::API
  SECRET_KEY = Rails.application.secrets.secret_base_key.to_s

  def authorize
    render json: { message: 'Please log in' }, status: 401 unless logged_in?
  end

  private

  def encode_token(payload)
    payload[:exp] = 4.days.from_now.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def auth_header
    request.headers['Authorization'].split(' ')[1]
  end

  def decoded_token
    return unless auth_header

    token = auth_header
    JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end

  def logged_in?
    !logged_in_user.nil?
  end
end
