class DropUsers < ActiveRecord::Migration[6.1]
  def change
    drop_join_table(:people, :users)
    drop_table(:users, force: :cascade )
  end
end
