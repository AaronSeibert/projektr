namespace :upgrade do
  desc "TODO"
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
end
