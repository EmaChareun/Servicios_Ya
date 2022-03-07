class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photos_professional, :string
    add_column :reviews, :photos, :string
  end
end
