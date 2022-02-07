class CreateActivityTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_templates do |t|
      t.string :name
      t.text :description
      t.text :default_values
      t.text :yield
      t.belongs_to :resource_subtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
