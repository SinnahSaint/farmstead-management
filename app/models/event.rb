class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks

  def self.task_info_changed(task)
    task.events.create!(description: "Task Info Changed", detail: "{ id: #{task.id}, changes: #{task.previous_changes.except(:updated_at)} ")
  end

  def self.task_assignment_changed(task:)
    old_user = User.find_by(id: task.previous_changes[:user_id].first)
    new_user = User.find_by(id: task.previous_changes[:user_id].second)
    description = if old_user.nil?
                    "Task Assigned"
                  elsif new_user.nil?
                    "Task Unassigned"
                  else
                    "Task Reassigned"
                  end
    task.events.create!(description: description, detail: "id: #{task.id}, name: #{task.name}, from: #{old_user&.name||"nil"}, to: #{new_user&.name||"nil"}, ")
  end
end
