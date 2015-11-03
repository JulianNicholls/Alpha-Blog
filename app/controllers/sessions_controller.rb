# Controller for user login sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    sparams = params[:session]
    user = User.find_by(email: sparams[:email].downcase)

    if user && user.authenticate(sparams[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have logged in successfully.'
      redirect_to user
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
end
