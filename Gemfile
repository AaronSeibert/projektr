source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
  gem 'pg'
  gem 'newrelic_rpm'
end

group :staging do
  gem 'rails_12factor'
end

group :production do
end

group :development do
  gem 'sqlite3'
end

gem 'execjs'
gem 'therubyracer'
gem 'carrierwave'
gem 'mini_magick'
gem 'simple-navigation'
gem 'bourbon'
gem 'devise'
gem 'font-awesome-sass'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'friendly_id'
gem 'cancan'
gem 'turbolinks'
gem 'turbolinks-redirect'
gem 'jquery-turbolinks'
#gem 'multimap'
gem 'rest-client'
gem 'delayed_job_active_record'
gem 'unicorn'
gem 'clockwork'
gem 'mailgun_rails'
gem 'fog', '~> 1.26.0'
gem 'foreman'
gem 'carrierwave_backgrounder'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
