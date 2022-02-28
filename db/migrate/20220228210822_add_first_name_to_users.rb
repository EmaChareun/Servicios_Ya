class AddFirstNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :string
    add_column :users, :job, :text, array: true, default: []
    add_column :users, :validation, :boolean, default: false
    add_column :users, :avatar, :string

  end
end
