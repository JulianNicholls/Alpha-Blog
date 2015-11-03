# Users controller
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = 'Your account was updated successfully.'
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    flash[:danger] = "#{@user.username} and all of their articles have been removed successfully."
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find params[:id]
  end

  def require_same_user
    return if logged_in? && (current_user?(@user) || current_user.admin?)

    flash[:danger] = 'You can only edit your own account.'
    redirect_to users_path
  end

  def require_admin
    return if logged_in? && current_user.admin?

    flash[:danger] = 'Only admin users can perform that task.'
  end
end
