class AddInactiveToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :inactive, :boolean, default: false
  end
end
