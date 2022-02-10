class Resource < ApplicationRecord
  belongs_to :resource_subtype
  
  has_many :activities
  has_many :events

  validates :name, presence: true
end
