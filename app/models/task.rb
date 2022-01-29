class Task < ApplicationRecord
  belongs_to :user, optional: true

  has_many :tasks_events
  has_many :events, through: :tasks_events

  has_many :activities_tasks 
  has_many :activities, through: :activities_tasks
end
