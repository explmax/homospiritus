CarrierWave.configure do |config|
  config.cache_dir = File.join(Rails.root, "tmp", "uploads")
  config.storage = :fog

  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]
  }

  case Rails.env.to_sym
    when :development
      config.storage = :file
    when :production
      config.fog_directory  = ENV["FOG_MEDIA_DIRECTORY"]
      config.fog_host       = "//#{ ENV["FOG_MEDIA_DIRECTORY"] }.s3.amazonaws.com"
      config.fog_attributes = {"Cache-Control"=>"max-age=315576000"}  # optional, defaults to {}
  end
end
