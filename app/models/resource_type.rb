class ResourceType < ApplicationRecord
  has_many :resource_subtypes

  validates :name, presence: true
end
