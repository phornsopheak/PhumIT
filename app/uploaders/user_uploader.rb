# encoding: utf-8

class UserUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def rails_admin_crop
    return unless model.rails_admin_cropping?
      manipulate! do |img|
      ::RailsAdminJcrop::ImageHelper.crop(img, model.crop_w, model.crop_h, model.crop_x, model.crop_y, conforms)
      img
    end
  end

  version :thumb do
    process :rails_admin_crop
    process resize_to_fill: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  protected
  def check_article_model?
    binding.pry
    :model == 'Article'
  end

  def check_user_model?
    :model == 'User'
  end

end
