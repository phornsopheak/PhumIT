class StaticPageController < ApplicationController
  def about_us
    @categories = Category.all
  end

  def home
    @articles = Article.where(state: 0).limit 9
    @news = Category.first
    @news_articles = @news.articles.where(state: 0).limit(9)
    @computer = Category.second
    @computer_articles = @computer.articles.where(state: 0).limit(9)
    @mobile = Category.third
    @mobile_articles = @mobile.articles.where(state: 0).limit(9)
    @knowledge = Category.fourth
    @knowledge_articles = @knowledge.articles.where(state: 0).limit(9)
    @electronic_device = Category.fifth
    @electronic_device_articles = @electronic_device.articles.where(state: 0).limit(9)
  end

  def google8f8e10d7f43bf086
  end
end
