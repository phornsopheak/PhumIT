class CategoriesController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]

  def show
    @category = Category.find params[:id]
    @articles = @category.articles.where(state: 0).page(params[:page]).per(10)
    @popular_articles = @category.articles.where(state: 0).order(view: :desc).limit(4)
    @relate_articles = @category.articles.where(state: 0).limit(4)
  end
end
