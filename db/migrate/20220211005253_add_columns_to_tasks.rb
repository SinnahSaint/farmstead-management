class AddColumnsToTasks < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.text "description"
      t.text "default_values"
    end
  end
end
