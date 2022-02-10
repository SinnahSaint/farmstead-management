class ModifyActivities < ActiveRecord::Migration[6.1]
  def change
    change_table :activities do |t|
      t.text "default_values" 
      t.text "yield"
      t.integer "resource_id"
      t.index ["resource_id"], name: "resource_id_on_activity_id"
      t.integer "activity_template_id"
      t.index ["activity_template_id"], name: "activity_template_id_on_activity_id"
    end
  end
end
