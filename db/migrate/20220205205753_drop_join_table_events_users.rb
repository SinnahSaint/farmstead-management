class DropJoinTableEventsUsers < ActiveRecord::Migration[6.1]
  def change
    drop_join_table(:events, :users )
  end
end
