class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :review_tables do |t|
      t.text :review_entry
      t.references :chefs
      t.references :recipes
      t.timestamps
    end
  end
end
