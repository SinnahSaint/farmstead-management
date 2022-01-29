class Event < ApplicationRecord
  has_many :users_events
  has_many :tasks_events
end
