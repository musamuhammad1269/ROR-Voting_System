require "application_system_test_case"

class ConstituenciesTest < ApplicationSystemTestCase
  setup do
    @constituency = constituencies(:one)
  end

  test "visiting the index" do
    visit constituencies_url
    assert_selector "h1", text: "Constituencies"
  end

  test "should create constituency" do
    visit constituencies_url
    click_on "New constituency"

    check "Display in navbar" if @constituency.display_in_navbar
    fill_in "Name", with: @constituency.name
    click_on "Create Constituency"

    assert_text "Constituency was successfully created"
    click_on "Back"
  end

  test "should update Constituency" do
    visit constituency_url(@constituency)
    click_on "Edit this constituency", match: :first

    check "Display in navbar" if @constituency.display_in_navbar
    fill_in "Name", with: @constituency.name
    click_on "Update Constituency"

    assert_text "Constituency was successfully updated"
    click_on "Back"
  end

  test "should destroy Constituency" do
    visit constituency_url(@constituency)
    click_on "Destroy this constituency", match: :first

    assert_text "Constituency was successfully destroyed"
  end
end
