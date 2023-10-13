require "test_helper"

class DisplaysControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get displays_display_url
    assert_response :success
  end
end
