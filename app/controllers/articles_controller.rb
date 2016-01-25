class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_article, except: :index
  before_action :update_number_of_view, only: :show
  before_action :side_bar_for_index, only: :index
  before_action :side_bar_for_show, only: :show

  def index
    @articles = @q.result.where(state: 0).page(params[:page]).per(10)
  end

  def show
  end

  private
  def find_article
    @article = Article.find params[:id]
  end

  def update_number_of_view
    view = @article.view.nil? ? 1 : @article.view + 1
    @article.update_attribute(:view, view)
  end

  def side_bar_for_index
    @popular_articles = Article.where(state: 0).order(view: :desc).limit(4)
    @relate_articles = Article.where(state: 0).limit(4)
    @category = Category.first
  end

  def side_bar_for_show
    @category = @article.categories.first
    @popular_articles = @category.articles.where(state: 0).order(view: :desc).limit(4)
    @relate_articles = @category.articles.where(state: 0).limit(4)
  end
end
