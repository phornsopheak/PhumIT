class Article < ActiveRecord::Base
  has_many :category_articles
  has_many :categories, through: :category_articles
  has_many :list_articles
  has_many :lists, through: :list_articles
end
