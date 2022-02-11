class Task < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :activity, -> { includes :resource }

  has_many :events

  validates :name, presence: true
end
