class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def current_user
    session[:id] ? User.find(session[:id]) : nil
  end

  def signed_in?
    current_user != nil
  end
end
