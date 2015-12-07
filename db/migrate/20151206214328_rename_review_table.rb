class RenameReviewTable < ActiveRecord::Migration
  def change
     rename_table :review_tables, :reviews
  end  
end
