require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    
    @chef = Chef.new(chefname: "chef 1", email: "chef@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
 
  test "chef name should be present" do
    @chef.chefname=nil
    assert_not @chef.valid?
  end

  test "chefname length should not be too short" do  
    @chef.chefname="a"*2
    assert_not @chef.valid?
  end
  
  test "chef name legnth should not be too long" do
    @chef.chefname="a"*200
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email=nil
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    @chef.save
    @chef2 = @chef.dup
    @chef2.email = @chef.email.upcase
    @chef2.save
    assert_not @chef2.valid?
  end

  test "email should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.com smash!smash@smash.com first.last@doman.com]
    valid_addresses.each do |val|
      @chef.email = val
      assert @chef.valid?, "#{val.inspect} should be valid"
    end
  end
  

  test "email should reject invalid addresses" do
    invalid_addresses = %w[user@eee.{com R_TDD-DS@eee,com smash!smash@_smash.com @first.last@doman.com]
    invalid_addresses.each do |inval|
      @chef.email = inval
      assert_not @chef.valid?, "#{inval.inspect} should not be valid"
    end
  end

end
