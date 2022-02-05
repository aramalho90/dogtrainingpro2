require "application_system_test_case"

class GrouptrainsTest < ApplicationSystemTestCase
  setup do
    @grouptrain = grouptrains(:one)
  end

  test "visiting the index" do
    visit grouptrains_url
    assert_selector "h1", text: "Grouptrains"
  end

  test "creating a Grouptrain" do
    visit grouptrains_url
    click_on "New Grouptrain"

    check "Inscr paid" if @grouptrain.inscr_paid
    fill_in "Status", with: @grouptrain.status
    fill_in "Teoric1", with: @grouptrain.teoric1
    fill_in "Teoric2", with: @grouptrain.teoric2
    check "Teoric paid" if @grouptrain.teoric_paid
    click_on "Create Grouptrain"

    assert_text "Grouptrain was successfully created"
    click_on "Back"
  end

  test "updating a Grouptrain" do
    visit grouptrains_url
    click_on "Edit", match: :first

    check "Inscr paid" if @grouptrain.inscr_paid
    fill_in "Status", with: @grouptrain.status
    fill_in "Teoric1", with: @grouptrain.teoric1
    fill_in "Teoric2", with: @grouptrain.teoric2
    check "Teoric paid" if @grouptrain.teoric_paid
    click_on "Update Grouptrain"

    assert_text "Grouptrain was successfully updated"
    click_on "Back"
  end

  test "destroying a Grouptrain" do
    visit grouptrains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grouptrain was successfully destroyed"
  end
end
