json.extract! event, :id, :description, :detail, :created_at, :updated_at
json.url event_url(event, format: :json)
