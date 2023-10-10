require "application_system_test_case"

class CategoliesTest < ApplicationSystemTestCase
  setup do
    @categoly = categolies(:one)
  end

  test "visiting the index" do
    visit categolies_url
    assert_selector "h1", text: "Categolies"
  end

  test "creating a Categoly" do
    visit categolies_url
    click_on "New Categoly"

    fill_in "Api-category", with: @categoly.api-category
    fill_in "Category1", with: @categoly.category1
    fill_in "Category2", with: @categoly.category2
    fill_in "Category3", with: @categoly.category3
    fill_in "Name", with: @categoly.name
    click_on "Create Categoly"

    assert_text "Categoly was successfully created"
    click_on "Back"
  end

  test "updating a Categoly" do
    visit categolies_url
    click_on "Edit", match: :first

    fill_in "Api-category", with: @categoly.api-category
    fill_in "Category1", with: @categoly.category1
    fill_in "Category2", with: @categoly.category2
    fill_in "Category3", with: @categoly.category3
    fill_in "Name", with: @categoly.name
    click_on "Update Categoly"

    assert_text "Categoly was successfully updated"
    click_on "Back"
  end

  test "destroying a Categoly" do
    visit categolies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categoly was successfully destroyed"
  end
end
