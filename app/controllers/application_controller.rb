class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  require 'csv'

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to users_path if current_user.nil?
  end

end
