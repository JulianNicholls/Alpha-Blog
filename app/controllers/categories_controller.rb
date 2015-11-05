class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate page: params[:page], per_page: 10
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = 'The new category was created successfully.'
      redirect_to categories_path
    else
      render :new
    end
  end

  def show

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    return if logged_in? && current_user.admin?

    flash[:danger] = "Only admins can perform that action."
    redirect_to categories_path
  end
end
