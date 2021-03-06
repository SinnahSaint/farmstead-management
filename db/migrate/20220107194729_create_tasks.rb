class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.belongs_to :user, null: true, foreign_key: true
      t.datetime :start
      t.datetime :due

      t.timestamps
    end
  end
end
