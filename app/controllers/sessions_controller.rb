# Controller for user login sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_email.downcase)

    if user && user.authenticate(session_password)
      login_user user
    else
      flash.now[:danger] = 'Your email address or password were not recognised.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out successfully.'
    redirect_to root_path
  end

  private

  def session_params
    params[:session]
  end

  def session_password
    session_params[:password]
  end

  def session_email
    session_params[:email]
  end

  def login_user(user)
    session[:user_id] = user.id
    flash[:success] = 'You have logged in successfully.'
    redirect_to user
  end
end
