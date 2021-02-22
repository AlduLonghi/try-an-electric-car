Cloudinary.config do |config|
    config.cloud_name = ENV["CLOUD_NAME"]
    config.api_key = ENV["CLOUD_API_KEY"]
    config.api_secret = ENV["CLOUD_API_SECRET"]
  end