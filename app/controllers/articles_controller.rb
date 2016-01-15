class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = @q.result.page(params[:page]).per(10)
  end

  def show
    @article = Article.find params[:id]
    @category = @article.categories.first
    @popular_articles = @category.articles.order(view: :desc).limit(4)
    @relate_articles = @category.articles.limit(4)
  end
end
