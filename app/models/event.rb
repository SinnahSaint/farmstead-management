class Event < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :task, optional: true
  # belongs_to :resource, optional: true
  # belongs_to :activity, optional: true

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
