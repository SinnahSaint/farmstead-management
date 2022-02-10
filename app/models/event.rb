class Event < ApplicationRecord
  belongs_to :activity, optional: true
  belongs_to :person, optional: true
  belongs_to :resource, optional: true
  belongs_to :task, optional: true

  def self.activity_created(activity: )
    activity.events.create!(description: "Created Activity", detail: "{ id: #{activity.id}, name: #{activity.name}, resource: #{activity.resource.name} }")
  end

  def self.activity_info_changed(activity: )
    activity.events.create!(description: "Activity Info Changed", detail: "{ id: #{activity.id}, changes: #{activity.previous_changes.except(:inactive, :updated_at)} ")
  end

  def self.activity_status_changed(activity: )
    description = if activity.previous_changes[:inactive].second == true
                    "Activity Deactivated"
                  else
                    "Activity Reactivated"
                  end

    activity.events.create!(description: description, detail: "id: #{activity.id}, name: #{activity.name}")
  end

  def self.person_created(person: )
    person.events.create!(description: "Created Person", detail: "{ id: #{person.id}, name: #{person.name}, }")
  end

  def self.person_info_changed(person: )
    person.events.create!(description: "Person Info Changed", detail: "{ id: #{person.id}, changes: #{person.previous_changes.except(:inactive, :updated_at)} ")
  end

  def self.person_status_changed(person: )
    description = if person.previous_changes[:inactive].second == true
                    "Person Deactivated"
                  else
                    "Person Reactivated"
                  end

    person.events.create!(description: description, detail: "id: #{person.id}, name: #{person.name}")
  end

  def self.resource_created(resource: )
    resource.events.create!(description: "Created Resource", detail: "{ id: #{resource.id}, name: #{resource.name}, subtype: #{resource.resource_subtype_id} }")
  end

  def self.resource_info_changed(activity: )
    resource.events.create!(description: "Resource Info Changed", detail: "{ id: #{resource.id}, changes: #{resource.previous_changes.except(:inactive, :updated_at)} ")
  end

  def self.resource_status_changed(resource: )
    description = if resource.previous_changes[:inactive].second == true
                    "Resource Deactivated"
                  else
                    "Resource Reactivated Somehow?!"
                  end

    resource.events.create!(description: description, detail: "id: #{resource.id}, name: #{resource.name}, date off farm: #{resource.off_farm_date}")
  end

  def self.task_created(task: )
    task.events.create!(description: "Created Task", detail: "{ id: #{task.id}, name: #{task.name}, }") 
  end

  def self.task_info_changed(task: )
    task.events.create!(description: "Task Info Changed", detail: "{ id: #{task.id}, changes: #{task.previous_changes.except(:person_id, :updated_at)} ")
  end

  def self.task_assignment_changed(task: )
    old_person = Person.find_by(id: task.previous_changes[:person_id].first)
    new_person = Person.find_by(id: task.previous_changes[:person_id].second)
    description = if old_person.nil?
                    "Task Assigned"
                  elsif new_person.nil?
                    "Task Unassigned"
                  else
                    "Task Reassigned"
                  end
    task.events.create!(description: description, detail: "id: #{task.id}, name: #{task.name}, from: #{old_person&.name||"nil"}, to: #{new_person&.name||"nil"}, ")
  end

  def self.task_status_changed(task: )
    description = if task.previous_changes[:complete].second == true
      "Task Completed"
    else
      "Task Reactivated"
    end
  
    task.events.create!(description: description, detail: "id: #{task.id}, name: #{task.name}")
  end
end
