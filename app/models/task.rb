class Task < ApplicationRecord
  belongs_to :user, optional: true
  has_many :activities_tasks 
  has_many :activities, through: :activities_tasks
end
