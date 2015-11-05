class CategoriesController < ApplicationController
  def index
    @categories = Category.all
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
end
