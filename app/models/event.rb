class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks

  def self.user_created(user: )
    user.events.create!(description: "Created User", detail: "{ id: #{@user.id}, name: #{@user.name}, }")
  end

  def self.user_info_changed(user: )
    user.events.create!(description: "User Info Changed", detail: "{ id: #{user.id}, changes: #{user.previous_changes.except(:inactive, :updated_at)} ")
  end

  def self.user_status_changed(user: )
    description = if user.previous_changes[:inactive].second == true
                    "User Deactivated"
                  else
                    "User Reactivated"
                  end

    user.events.create!(description: description, detail: "id: #{@user.id}, name: #{@user.name}")
  end



  def self.task_created(task: )
    task.events.create!(description: "Created Task", detail: "{ id: #{@task.id}, name: #{@task.name}, }") 
  end

  def self.task_info_changed(task: )
    task.events.create!(description: "Task Info Changed", detail: "{ id: #{task.id}, changes: #{task.previous_changes.except(:user_id, :updated_at)} ")
  end

  def self.task_assignment_changed(task: )
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
