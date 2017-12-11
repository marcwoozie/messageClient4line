json.extract! user, :id, :name, :line_display_name, :line_user_id, :line_picture_url, :line_status_message, :created_at, :updated_at
json.url user_url(user, format: :json)
