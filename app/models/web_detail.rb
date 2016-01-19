class WebDetail < ActiveRecord::Base
  include RailsAdminWebdetail

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :about_us, presence: true

  mount_uploader :image, PhotoUploader
end
