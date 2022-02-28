require "application_system_test_case"

class GroupclassesTest < ApplicationSystemTestCase
  setup do
    @groupclass = groupclasses(:one)
  end

  test "visiting the index" do
    visit groupclasses_url
    assert_selector "h1", text: "Groupclasses"
  end

  test "creating a Groupclass" do
    visit groupclasses_url
    click_on "New Groupclass"

    fill_in "Class date", with: @groupclass.class_date
    fill_in "Grouptrain", with: @groupclass.grouptrain_id
    click_on "Create Groupclass"

    assert_text "Groupclass was successfully created"
    click_on "Back"
  end

  test "updating a Groupclass" do
    visit groupclasses_url
    click_on "Edit", match: :first

    fill_in "Class date", with: @groupclass.class_date
    fill_in "Grouptrain", with: @groupclass.grouptrain_id
    click_on "Update Groupclass"

    assert_text "Groupclass was successfully updated"
    click_on "Back"
  end

  test "destroying a Groupclass" do
    visit groupclasses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Groupclass was successfully destroyed"
  end
end
