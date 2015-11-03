class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully."
      redirect_to user
    else
      flash.now[:danger] = "Your email address or password were not recognised."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged outs uccessfully."
    redirect_to root_path
  end
end
