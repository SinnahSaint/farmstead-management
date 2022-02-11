class FixYieldToResults < ActiveRecord::Migration[6.1]
  def change
    change_table :activities do |t|
      t.rename :yield, :results
    end
    change_table :activity_templates do |t|
      t.rename :yield, :results
    end
    change_table :tasks do |t|
      t.text :results
    end
  end
end
