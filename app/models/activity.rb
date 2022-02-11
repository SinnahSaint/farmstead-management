class Activity < ApplicationRecord
  belongs_to :activity_template
  belongs_to :resource

  has_many :tasks
  has_many :events

  validates :name, presence: true

  
end
