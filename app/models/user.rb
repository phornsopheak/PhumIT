class User < ActiveRecord::Base
  include RailsAdminUser

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  #, :registerable, :recoverable,
  mount_uploader :image, PhotoUploader
end
