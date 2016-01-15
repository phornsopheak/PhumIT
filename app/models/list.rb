class List < ActiveRecord::Base
  belongs_to :category
  has_many :list_articles
  has_many :articles, through: :list_articles
end
