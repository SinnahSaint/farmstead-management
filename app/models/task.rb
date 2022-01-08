class Task < ApplicationRecord
  belongs_to :user, optional: true
  has_many :activities
end
