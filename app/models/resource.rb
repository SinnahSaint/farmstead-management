class Resource < ApplicationRecord
  belongs_to :resource_subtype

  validates :name, presence: true
end
