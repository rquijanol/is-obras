require 'dragonfly'
require 'dragonfly/dropbox_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

 datastore :dropbox,
  app_key:              ENV['DROPBOX_APP_KEY'],
  app_secret:           ENV['DROPBOX_APP_SECRET'],
  access_token:         ENV['DROPBOX_ACCESS_TOKEN'],
  access_token_secret:  ENV['DROPBOX_ACCESS_TOKEN_SECRET'],
  user_id:              ENV['DROPBOX_USER_ID'],     
  root_path:            Rails.env # optional
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
