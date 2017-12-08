require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Plus"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Plus"
  end

  test "should get blog" do
    get blog_path
    assert_response :success
    assert_select "title", "Plus-Blog"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Plus-About"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Plus-Contact"
  end

end
