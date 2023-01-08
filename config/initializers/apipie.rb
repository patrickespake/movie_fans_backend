Apipie.configure do |config|
  config.app_name                = "Movie Fans Backend API"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apipie"
  config.default_version         = "V1"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
