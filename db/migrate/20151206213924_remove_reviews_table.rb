class RemoveReviewsTable < ActiveRecord::Migration
  def change
    drop_table :reviews
  end
end
