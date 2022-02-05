json.extract! task, :id, :name, :person_id, :start, :due, :created_at, :updated_at
json.url task_url(task, format: :json)
