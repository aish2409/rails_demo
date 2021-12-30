class LoginController < ApplicationController

  def authenticate
    unless request.method == "GET"
      user = User.find_by(email: user_params[:email])
      if user.present?
        if user.authenticate(user_params[:password])
          flash[:alert] = "login successful"
          redirect_to users_path
        else
          render :authenticate
        end
      else
        flash[:alert] = "User is not exist"
        redirect_to root_path
      end
    end
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
