require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Plus"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Plus"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Plus"
  end

  test "should get blog" do
    get static_pages_blog_url
    assert_response :success
    assert_select "title", "Plus-Blog"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "Plus-About"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Plus-Contact"
  end

end
