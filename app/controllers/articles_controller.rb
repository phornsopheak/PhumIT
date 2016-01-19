class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_article, except: :index
  before_action :update_number_of_view, only: :show

  def index
    @articles = @q.result.page(params[:page]).per(10)
  end

  def show
    @category = @article.categories.first
    @popular_articles = @category.articles.order(view: :desc).limit(4)
    @relate_articles = @category.articles.limit(4)
  end

  private
  def find_article
    @article = Article.find params[:id]
  end

  def update_number_of_view
    view = @article.view.nil? ? 1 : @article.view + 1
    @article.update_attribute(:view, view)
  end
end
