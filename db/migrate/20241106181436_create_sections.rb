class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.references :documentation, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
