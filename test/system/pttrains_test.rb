require "application_system_test_case"

class PttrainsTest < ApplicationSystemTestCase
  setup do
    @pttrain = pttrains(:one)
  end

  test "visiting the index" do
    visit pttrains_url
    assert_selector "h1", text: "Pttrains"
  end

  test "creating a Pttrain" do
    visit pttrains_url
    click_on "New Pttrain"

    fill_in "Inscr paid", with: @pttrain.inscr_paid
    fill_in "Obs", with: @pttrain.obs
    fill_in "Status", with: @pttrain.status
    fill_in "Test1", with: @pttrain.test1
    fill_in "Test2", with: @pttrain.test2
    fill_in "Test3", with: @pttrain.test3
    fill_in "Test4", with: @pttrain.test4
    click_on "Create Pttrain"

    assert_text "Pttrain was successfully created"
    click_on "Back"
  end

  test "updating a Pttrain" do
    visit pttrains_url
    click_on "Edit", match: :first

    fill_in "Inscr paid", with: @pttrain.inscr_paid
    fill_in "Obs", with: @pttrain.obs
    fill_in "Status", with: @pttrain.status
    fill_in "Test1", with: @pttrain.test1
    fill_in "Test2", with: @pttrain.test2
    fill_in "Test3", with: @pttrain.test3
    fill_in "Test4", with: @pttrain.test4
    click_on "Update Pttrain"

    assert_text "Pttrain was successfully updated"
    click_on "Back"
  end

  test "destroying a Pttrain" do
    visit pttrains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pttrain was successfully destroyed"
  end
end
