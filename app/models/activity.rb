class Activity < ApplicationRecord
  has_many :tasks, through :activities_tasks
end
