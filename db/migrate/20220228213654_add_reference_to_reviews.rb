class AddReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :user
    add_reference :reviews, :user, foreign_key: true
  end
end
