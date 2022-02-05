class ChangeTaskUserColumnToPerson < ActiveRecord::Migration[6.1]
  def change
    remove_column(:tasks, :user_id)
    add_column(:tasks, :person_id, :integer, null: true, foreign_key: true)
  end
end
