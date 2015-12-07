class RenameReviewFieldNames < ActiveRecord::Migration
  def change
    rename_column :reviews, :chefs_id, :chef_id
    rename_column :reviews, :recipes_id, :recipe_id
  end
end
