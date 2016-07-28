class StaticPageController < ApplicationController
  def about_us
    @categories = Category.all
  end

  def home
    @popular_articles = Article.unscoped.where(state: 0).order(view: :desc).limit(4)
    @articles = @q.result.where(state: 0).page(params[:page]).per(10)
    @activities = PublicActivity::Activity.all
    binding.pry
  end
end
