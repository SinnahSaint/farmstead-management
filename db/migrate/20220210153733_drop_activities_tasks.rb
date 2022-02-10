class DropActivitiesTasks < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :activities, :tasks
  end
end
