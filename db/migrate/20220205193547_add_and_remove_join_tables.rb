class AddAndRemoveJoinTables < ActiveRecord::Migration[6.1]
  def change
    create_join_table :events, :people
    create_join_table :people, :tasks
    create_join_table :people, :users
  end
end
