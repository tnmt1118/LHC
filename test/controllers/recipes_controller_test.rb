require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get recipes_display_url
    assert_response :success
  end

  test "should get details" do
    get recipes_details_url
    assert_response :success
  end

  test "should get search" do
    get reccipes_search_url
    assert_response :success
  end
end
