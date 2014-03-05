namespace :upgrade do
  
  desc "Migrates images from file storage to S3"
  task migrate_screenshots: :environment do
    Screenshot.all.each do |s|
      if s.image?
        # If you've overridden the storage path in the uploader, you'll need to
        # use a different path here.
        #
        # "s[:image]" is used to get the actual attribute value instead
        # of the mounted uploader -- the base filename of the image file.
        path = Rails.root.join('public', 'uploads', 'screenshot', 'image', s[:id].to_s, s[:image])
  
        unless path.exist?
          puts "#{path} doesn't exist. Double check your paths!"
          next
        end
  
        s.image = path.open
        s.save!
        puts "transferred #{s.id}"
      else
        puts "================================= ATTACHMENT NOT FOUND: ID: #{s.id}"
      end
    end
  end
  
  desc "Reprocesses images, used when adding a size for something"
  task reprocess_images: :environment do
    Screenshot.all.each do |s|
      s.image.recreate_versions!
    end
  end
end
