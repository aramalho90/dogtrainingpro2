require "application_system_test_case"

class GroupmapsTest < ApplicationSystemTestCase
  setup do
    @groupmap = groupmaps(:one)
  end

  test "visiting the index" do
    visit groupmaps_url
    assert_selector "h1", text: "Groupmaps"
  end

  test "creating a Groupmap" do
    visit groupmaps_url
    click_on "New Groupmap"

    fill_in "Limit", with: @groupmap.limit
    fill_in "Time", with: @groupmap.time
    click_on "Create Groupmap"

    assert_text "Groupmap was successfully created"
    click_on "Back"
  end

  test "updating a Groupmap" do
    visit groupmaps_url
    click_on "Edit", match: :first

    fill_in "Limit", with: @groupmap.limit
    fill_in "Time", with: @groupmap.time
    click_on "Update Groupmap"

    assert_text "Groupmap was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupmap" do
    visit groupmaps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupmap was successfully destroyed"
  end
end
