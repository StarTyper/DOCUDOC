class AddInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :role, :string, null: false, default: 'assistant'
  end
end
