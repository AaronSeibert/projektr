CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => ENV['RS_CLOUD_USER'],
    :rackspace_api_key  => ENV['RS_CLOUD_KEY'],
    :rackspace_region   => :iad                # optional, defaults to :dfw
  }
  config.fog_directory = ENV['RS_CLOUD_DIR']
end
