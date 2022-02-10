class Drop < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :events, :people
    drop_join_table :events, :tasks

    change_table :events do |t|
    t.integer "person_id"
    t.index ["person_id"], name: "person_id_on_event_id"
    t.integer "task_id"
    t.index ["task_id"], name: "task_id_on_event_id"
    t.integer "activity_id"
    t.index ["activity_id"], name: "activity_id_on_event_id"
    t.integer "resource_id"
    t.index ["resource_id"], name: "resource_id_on_event_id"
    end

  end
end
