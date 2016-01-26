class Category < ActiveRecord::Base
  include RailsAdminCategory

  has_many :category_articles
  has_many :articles, through: :category_articles

  mount_uploader :image, PhotoUploader

  validates :title, presence: true
  validates :description, presence: true
end
