require "application_system_test_case"

class PtmapsTest < ApplicationSystemTestCase
  setup do
    @ptmap = ptmaps(:one)
  end

  test "visiting the index" do
    visit ptmaps_url
    assert_selector "h1", text: "Ptmaps"
  end

  test "creating a Ptmap" do
    visit ptmaps_url
    click_on "New Ptmap"

    fill_in "Day", with: @ptmap.day
    fill_in "Limit", with: @ptmap.limit
    click_on "Create Ptmap"

    assert_text "Ptmap was successfully created"
    click_on "Back"
  end

  test "updating a Ptmap" do
    visit ptmaps_url
    click_on "Edit", match: :first

    fill_in "Day", with: @ptmap.day
    fill_in "Limit", with: @ptmap.limit
    click_on "Update Ptmap"

    assert_text "Ptmap was successfully updated"
    click_on "Back"
  end

  test "destroying a Ptmap" do
    visit ptmaps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ptmap was successfully destroyed"
  end
end
