class Task < ApplicationRecord
  belongs_to :person, optional: true

  has_and_belongs_to_many :events

  has_many :activities_tasks 
  has_many :activities, through: :activities_tasks

  validates :name, presence: true
end
