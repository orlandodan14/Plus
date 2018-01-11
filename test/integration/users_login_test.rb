require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
    @user = users(:michael)
  end

	test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "span", @user.first_name
    assert is_logged_in?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "span", @user.first_name
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a", "Login"
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a", "Register"
  end

  test "login with remembering" do
    log_in_as(@user, remember: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@user, remember: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember: '0')
    assert_empty cookies['remember_token']
  end
end
