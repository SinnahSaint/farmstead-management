class AddOffFarmDateToResources < ActiveRecord::Migration[6.1]
  def change
    add_column :resources, :off_farm_date, :date
  end
end
