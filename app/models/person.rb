class Person < ApplicationRecord
  has_many :tasks
  has_and_belongs_to_many :events

  validates :name, presence: true
  validate :must_include_contact
  
  def must_include_contact
    if phone.blank? & email.blank?
      errors.add(:base, "We need to be able to reach you." )
    end
  end

end
