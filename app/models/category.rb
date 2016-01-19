class Category < ActiveRecord::Base
  include RailsAdminCategory

  has_many :category_articles
  has_many :articles, through: :category_articles

  validates :title, presence: true
  validates :description, presence: true
end
