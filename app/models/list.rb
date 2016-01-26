class List < ActiveRecord::Base
  include RailsAdminList

  belongs_to :category
  has_many :list_articles
  has_many :articles, through: :list_articles

  mount_uploader :image, PhotoUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
