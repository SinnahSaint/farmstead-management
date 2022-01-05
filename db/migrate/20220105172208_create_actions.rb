class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.string :name
      t.text :description
      t.boolean :inactive

      t.timestamps
    end
  end
end
