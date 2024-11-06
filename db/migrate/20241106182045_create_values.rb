class CreateValues < ActiveRecord::Migration[7.1]
  def change
    create_table :values do |t|
      t.references :row, null: false, foreign_key: true
      t.text :content
      t.boolean :favorite, null: false, default: 0

      t.timestamps
    end
  end
end
