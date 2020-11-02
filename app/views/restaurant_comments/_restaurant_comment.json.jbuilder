json.extract! restaurant_comment, :id, :body, :client_name, :client_id, :created_at, :updated_at
json.url restaurant_comment_url(restaurant_comment, format: :json)
