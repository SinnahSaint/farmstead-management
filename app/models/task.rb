class Task < ApplicationRecord
  belongs_to :user, optional: true

  has_and_belongs_to_many :events

  has_many :activities_tasks 
  has_many :activities, through: :activities_tasks
end
