# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick
   include ::CarrierWave::Backgrounder::Delay
   
  # Choose what kind of storage to use for this uploader:
  storage :fog
  
  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "processing.gif"].compact.join('_'))
  end
  
  version :thumb do
    process :resize_to_limit => [150, 150]
  end
  
  version :modal do
    process :resize_to_limit => [1140, nil]
  end

end
