class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :city
      t.string :detail
      t.string :image
      t.string :status
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.bigint :professional_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
