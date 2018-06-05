require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @user = User.new(name: "Mousa Halaseh", :email => "mousahalaseh@outlook.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be within range" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be within range" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "This email has been rejected: #{valid_address.inspect}. it should be valid though"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "This email has been accepted: #{invalid_address.inspect}. it should be invalid though"
    end
  end
end
