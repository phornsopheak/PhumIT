class Article < ActiveRecord::Base
  include RailsAdminArticle

  belongs_to :user
  has_many :category_articles
  has_many :categories, through: :category_articles
  has_many :list_articles
  has_many :lists, through: :list_articles

  mount_uploader :image, PhotoUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :source, presence: true
end
