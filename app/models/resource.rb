class Resource < ApplicationRecord
  belongs_to :resource_subtype
  
  has_many :activities
  has_many :events

  validates :name, presence: true

  after_create :build_activities


  def build_activities
    resource_subtype.activity_templates.each do |template|
      activity = activities.create!(activity_template_id: template.id,
                              name: template.name,
                              description: template.description,
                              default_values: template.default_values,
                              results: template.results,
                              inactive: true,
                              )

      Event.activity_created(activity: activity)
    end
  end

end
