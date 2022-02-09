class Activity < ApplicationRecord
  belongs_to :activity_template
  belongs_to :resource

  has_many :activities_tasks
  has_many :tasks, through: :activities_tasks

  validates :name, presence: true
end
