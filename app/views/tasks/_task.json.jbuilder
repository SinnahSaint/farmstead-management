json.extract! task, :id, :name, :user_id, :start, :due, :created_at, :updated_at
json.url task_url(task, format: :json)
