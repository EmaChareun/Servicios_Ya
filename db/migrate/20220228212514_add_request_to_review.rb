class AddRequestToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :request, foreign_key: true
    remove_column :reviews, :references
  end
end
