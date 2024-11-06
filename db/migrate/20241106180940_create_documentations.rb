class CreateDocumentations < ActiveRecord::Migration[7.1]
  def change
    create_table :documentations do |t|
      t.references :client, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :favorite, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :room_id, null: false

      t.timestamps
    end
  end
end
