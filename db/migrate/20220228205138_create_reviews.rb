class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
