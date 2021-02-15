class AuthController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id})
          cookies.signed[:jwt] = {value: token, httponly: true, expires: 1.week.from_now}
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
    end

    def destroy
        cookies.delete(:jwt)
    end
end
