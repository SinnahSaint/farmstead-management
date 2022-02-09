class Resource < ApplicationRecord
  belongs_to :resource_subtype
  has_many :activities

  validates :name, presence: true
end
