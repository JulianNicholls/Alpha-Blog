# Controller for Article actions
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate page: params[:page], per_page: 10
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    @article.user = current_user

    if @article.save
      flash[:success] = 'Your article was saved successully.'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:success] = 'Your article was updated successfully.'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:danger] = 'Your article was removed successfully.'
    else
      flash[:warning] = 'Your article could not be removed.'
    end

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def set_article
    @article = Article.find params[:id]
  end

  def require_same_user
    return if current_user?(@article.user) || current_user.admin?

    flash[:danger] = 'You can only edit or delete your own articles.'
    redirect_to articles_path
  end
end
