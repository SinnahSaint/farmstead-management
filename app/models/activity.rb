class Activity < ApplicationRecord
  has_many :activities_tasks
  has_many :tasks, through: :activities_tasks
end
