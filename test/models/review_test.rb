require 'test_helper'


class ReviewTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.create(name: "recipe 1", summary: "this is a test recipe summary", description: "thids is the recipe description")
    @review = Review.create(review_entry: "this is a review", recipe_id: @recipe.id, chef_id: @chef)
  end
  
  
  test "review should be valid" do
    assert @review.valid?  
  end

  test "review_entry should be present" do
    @review.review_entry=nil
    assert_not @review.valid?
  end

  test "review_entry length should not be too short" do  
    @review.review_entry="a"*4
    assert_not @review.valid?
  end
  
  test "review_entry legnth should not be too long" do
    @review.review_entry="a"*151
    assert_not @review.valid?
  end
  
  test "review should have a chef id" do
    @review.chef_id=nil
    assert_not @review.valid?
  end
  
end
