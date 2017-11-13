# encoding: utf-8
# CarrierWave uploader for hero images.
class HeroImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "blog/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [375, 225]
  end

  # Returns URL for image-asset
  def default_url
    "/assets/heroes/" + [filename].compact.join('_')
  end

  def root
    Rails.root.join 'public/'
  end

end
