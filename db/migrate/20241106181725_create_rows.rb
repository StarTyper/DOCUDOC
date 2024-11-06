class CreateRows < ActiveRecord::Migration[7.1]
  def change
    create_table :rows do |t|
      t.references :section, null: false, foreign_key: true
      t.string :name, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
