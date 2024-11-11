class AddCityToLocations < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :city, :string
    rename_column :locations, :state, :state_province
  end
end
