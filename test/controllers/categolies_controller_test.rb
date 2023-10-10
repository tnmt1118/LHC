require "test_helper"

class CategoliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoly = categolies(:one)
  end

  test "should get index" do
    get categolies_url
    assert_response :success
  end

  test "should get new" do
    get new_categoly_url
    assert_response :success
  end

  test "should create categoly" do
    assert_difference('Categoly.count') do
      post categolies_url, params: { categoly: { api-category: @categoly.api-category, category1: @categoly.category1, category2: @categoly.category2, category3: @categoly.category3, name: @categoly.name } }
    end

    assert_redirected_to categoly_url(Categoly.last)
  end

  test "should show categoly" do
    get categoly_url(@categoly)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoly_url(@categoly)
    assert_response :success
  end

  test "should update categoly" do
    patch categoly_url(@categoly), params: { categoly: { api-category: @categoly.api-category, category1: @categoly.category1, category2: @categoly.category2, category3: @categoly.category3, name: @categoly.name } }
    assert_redirected_to categoly_url(@categoly)
  end

  test "should destroy categoly" do
    assert_difference('Categoly.count', -1) do
      delete categoly_url(@categoly)
    end

    assert_redirected_to categolies_url
  end
end
