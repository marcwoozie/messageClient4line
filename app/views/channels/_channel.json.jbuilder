json.extract! channel, :id, :name, :description, :channel_id, :channel_secret, :app_type, :access_token, :created_at, :updated_at
json.url channel_url(channel, format: :json)
