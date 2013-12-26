class Screenshot < ActiveRecord::Base
  belongs_to :revision
  
  mount_uploader :image, ImageUploader
end
