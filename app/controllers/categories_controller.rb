class CategoriesController < ApplicationController

  def show
    @category = Category.find params[:id]
    @articles = @category.articles.page(params[:page]).per(10)
    @popular_articles = @category.articles.order(view: :desc).limit(4)
    @relate_articles = @category.articles.limit(4)
  end
end
