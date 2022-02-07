class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.date :date_of_birth
      t.date :date_on_farm
      t.belongs_to :resource_subtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
