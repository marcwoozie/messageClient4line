json.extract! channel_user, :id, :channel_id, :user_id, :created_at, :updated_at
json.url channel_user_url(channel_user, format: :json)
