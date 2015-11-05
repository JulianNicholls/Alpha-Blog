# Base application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :logged_in?

  def current_user
    id = session[:user_id]
    @current_user ||= User.find(id) if id
  end

  def current_user?(user)
    current_user == user
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:danger] = 'You must be logged in to perform that action.'
    redirect_to root_path
  end
end
