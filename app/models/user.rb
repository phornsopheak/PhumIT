class User < ActiveRecord::Base
  include RailsAdminUser

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  #, :registerable, :recoverable,
  mount_uploader :image, UserUploader

  enum role: [:admin, :manager]

  validates :username, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
