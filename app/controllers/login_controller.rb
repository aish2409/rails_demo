class LoginController < ApplicationController
  skip_before_action :authorize_request

  def authenticate
    unless request.method == "GET"
      user = User.find_by(email: user_params[:email])
      if user.present?
        if user.authenticate(user_params[:password])
          @token = JsonWebToken.encode(id: user.id)
          flash[:success] = "login successful"
          redirect_to users_path(token: @token)
        else
          flash[:notice] = "login failed"
          render :authenticate
        end
      else
        flash[:notice] = "User is not exist"
        redirect_to root_path
      end
    end
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end
end

