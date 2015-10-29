class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
#    render plain: params.inspect
    @article = Article.new article_params

    if @article.save
    else
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
