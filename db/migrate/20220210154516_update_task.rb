class UpdateTask < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.index ["person_id"], name: "index_tasks_on_person_id"
      t.integer :activity_id
      t.index ["activity_id"], name: "index_tasks_on_activity_id"
    end
  end
end
