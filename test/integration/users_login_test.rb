require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:mousa)
  end

  test "Login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: "invalid email",
                                        password: "Inva"}}
    assert 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

   test "Login with valid Information" do
     get login_path
     assert_template 'sessions/new'
     post login_path, params: {session: {email: @user.email,
                                        password: "something"}}
     assert_redirected_to @user
     follow_redirect!
     assert_template 'users/show'
     assert_select "a[href=?]", logout_path, count: 1
   end

end
