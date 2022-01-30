class User < ApplicationRecord
  has_many :tasks
  has_and_belongs_to_many :events

  validates :name, presence: true
  validate :must_include_contact
  
  def must_include_contact
    if phone.blank? & email.blank?
      errors.add(:base, "We need to be able to reach you." )
    end
  end

  # Meg shared another option for validation:
    # validates :phone, presence: true, unless: ->{ email.present? }
    # validates :email, presence: true, unless: ->{ phone.present? }
  # this is less good for my purpose because it would mislead the user 
  # who puts in neither by telling them that both are required.
  
end
