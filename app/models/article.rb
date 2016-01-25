class Article < ActiveRecord::Base
  before_create :user_to_article
  default_scope { order("id DESC") }

  include RailsAdminArticle

  belongs_to :user
  has_many :category_articles, dependent: :destroy
  has_many :categories, through: :category_articles
  has_many :list_articles, dependent: :destroy
  has_many :lists, through: :list_articles

  mount_uploader :image, PhotoUploader
  enum state: [:publish, :unpublish, :draft]

  validates :title, presence: true
  validates :description, presence: true
  validates :source, presence: true

  private
    def user_to_article
      self.user_id = 1
    end
end
