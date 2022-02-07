class CreateResourceSubtypes < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_subtypes do |t|
      t.string :name
      t.belongs_to :resource_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
