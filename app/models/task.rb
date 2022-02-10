class Task < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :activity

  has_many :events

  validates :name, presence: true
end
