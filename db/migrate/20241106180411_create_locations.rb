class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.references :client, null: false, foreign_key: true
      t.string :name
      t.string :country
      t.string :state
      t.string :zip_code
      t.string :street
      t.string :street_number

      t.timestamps
    end
  end
end
