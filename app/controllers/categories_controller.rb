# Controller for article categories
class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show]
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

  def edit

  end

  def update
    if @category.update category_params
      flash[:success] = 'The category name was updated successfully.'
      redirect_to @category
    else
      render :edit
    end
  end

  def show
    @articles = @category.articles.paginate page: params[:page], per_page: 10
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find params[:id]
  end

  def require_admin
    return if logged_in? && current_user.admin?

    flash[:danger] = 'Only admins can perform that action.'
    redirect_to categories_path
  end
end
