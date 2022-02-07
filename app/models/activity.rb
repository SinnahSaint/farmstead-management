class Activity < ApplicationRecord
  has_many :activities_tasks
  has_many :tasks, through: :activities_tasks
  
  belongs_to :activity_template
  belongs_to :resource
end
