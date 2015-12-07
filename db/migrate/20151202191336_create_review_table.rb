class CreateReviewTable < ActiveRecord::Migration
  def change
    create_table :review_tables do |t|
      t.text :review_entry
      t.references :chefs
      t.references :recipes
    end
  end
end
