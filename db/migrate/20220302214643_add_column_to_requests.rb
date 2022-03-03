class AddColumnToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :comment, :string
    add_column :requests, :balance, :integer
  end
end
