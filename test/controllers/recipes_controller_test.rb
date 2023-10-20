require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get reccipes_search_url
    assert_response :success
  end
end
