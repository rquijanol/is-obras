require 'dragonfly'
require 'dragonfly/dropbox_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick


  verify_urls true
  secret ENV['IKON']
  url_format "/media/:job/:name"
 
 if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
 datastore :dropbox,
  app_key:              ENV['DROPBOX_APP_KEY'],
  app_secret:           ENV['DROPBOX_APP_SECRET'],
  access_token:         ENV['DROPBOX_ACCESS_TOKEN'],
  access_token_secret:  ENV['DROPBOX_ACCESS_TOKEN_SECRET'],
  user_id:              ENV['DROPBOX_USER_ID'],     
  root_path:            Rails.env # optional

end

# Override the .url method...
define_url do |app, job, opts|
  thumb = Thumb.find_by_job(job.signature)
  # If (fetch 'some_uid' then resize to '180x180') has been stored already, give the datastore's remote url ...
  if thumb
    app.datastore.url_for(thumb.uid, :scheme => 'https')
    # ...otherwise give the local Dragonfly server url
  else
    app.server.url_for(job)
  end
end
 
# Before serving from the local Dragonfly server...
before_serve do |job, env|
  # ...store the thumbnail in the datastore...
  uid = job.store
 
  # ...keep track of its uid so next time we can serve directly from the datastore
  Thumb.create!(
      :uid => uid,
      :job => job.signature   # 'BAhbBls...' - holds all the job info
  )                           # e.g. fetch 'some_uid' then resize to '180x180'
end
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
