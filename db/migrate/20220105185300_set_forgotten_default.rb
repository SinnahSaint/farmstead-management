class SetForgottenDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :inactive, :boolean, default: false
  end
end
