class StaticPageController < ApplicationController
  def home
    @articles = Article.all.limit 9
    @news = Category.first
    @news_articles = @news.articles.limit(9)
    @computer = Category.second
    @computer_articles = @computer.articles.limit(9)
    @mobile = Category.third
    @mobile_articles = @mobile.articles.limit(9)
    @knowledge = Category.fourth
    @knowledge_articles = @knowledge.articles.limit(9)
    @electronic_device = Category.fifth
    @electronic_device_articles = @electronic_device.articles.limit(9)
  end
end
