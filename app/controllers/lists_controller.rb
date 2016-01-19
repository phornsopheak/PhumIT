class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @list = List.find params[:id]
    @articles = @list.articles.page(params[:page]).per(10)
    @category = @list.category
    @popular_articles = @category.articles.order(view: :desc).limit(4)
    @relate_articles = @category.articles.limit(4)
  end
end
