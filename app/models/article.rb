class Article < ActiveRecord::Base
  default_scope { order("id DESC") }

  include RailsAdminArticle
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user },
          on: {update: proc {|model, controller| model.view_changed? }}

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
  validates :link_source, presence: true
  validates :user, presence: true
  validates :state, presence: true
end
