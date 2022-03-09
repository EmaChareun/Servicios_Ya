class AddColumn2ToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :job
    add_column :users, :job, :string
  end
end
