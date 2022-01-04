class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize_request

  def authorize_request
    unless params[:controller].include?("admin")
      if params[:token].present?
        @token = params[:token]
        @decoded = JsonWebToken.decode(@token)
        @current_user = User.find(@decoded[:id])
      end
      unless @current_user.present?
        flash[:notice] = "You are not loged in"
        redirect_to root_path
      end
    end
  end
end
