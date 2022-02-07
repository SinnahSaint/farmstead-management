class ResourceSubtype < ApplicationRecord
  belongs_to :resource_type
  has_many :resources
  has_many :activity_templates

  validates :name, presence: true
end
