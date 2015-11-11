require 'test_helper'


class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "recipe 1", summary: "this is a test recipe summary", description: "thids is the recipe description", chef_id: 1)
  end
  
  
  test "recipe should be valid" do
    assert @recipe.valid?  
  end

  test "name should be present" do
    @recipe.name=nil
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do  
    @recipe.name="a"*4
    assert_not @recipe.valid?
  end
  
  test "name legnth should not be too long" do
    @recipe.name="a"*151
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description=nil
    assert_not @recipe.valid?
  end

  test "description length should not be too short" do  
    @recipe.description="a"*15
    assert_not @recipe.valid?
  
  end
  
  test "description legnth should not be too long" do
    @recipe.description="a"*550
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary=nil
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do  
    @recipe.summary="a"*9
    assert_not @recipe.valid?
  
  end
  
  test "summary legnth should not be too long" do
    @recipe.summary="a"*200
    assert_not @recipe.valid?
  end
  
  test "recipe should have a chef id" do
    @recipe.chef_id=nil
    assert_not @recipe.valid?
  end
  
end
