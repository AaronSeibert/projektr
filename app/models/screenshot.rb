class Screenshot < ActiveRecord::Base
  belongs_to :revision
  
  mount_uploader :image, ImageUploader
  process_in_background :image
  store_in_background :image
end
