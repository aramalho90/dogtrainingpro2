require "application_system_test_case"

class PtclassesTest < ApplicationSystemTestCase
  setup do
    @ptclass = ptclasses(:one)
  end

  test "visiting the index" do
    visit ptclasses_url
    assert_selector "h1", text: "Ptclasses"
  end

  test "creating a Ptclass" do
    visit ptclasses_url
    click_on "New Ptclass"

    fill_in "Class date", with: @ptclass.class_date
    fill_in "Dog", with: @ptclass.dog_id
    fill_in "Obs", with: @ptclass.obs
    click_on "Create Ptclass"

    assert_text "Ptclass was successfully created"
    click_on "Back"
  end

  test "updating a Ptclass" do
    visit ptclasses_url
    click_on "Edit", match: :first

    fill_in "Class date", with: @ptclass.class_date
    fill_in "Dog", with: @ptclass.dog_id
    fill_in "Obs", with: @ptclass.obs
    click_on "Update Ptclass"

    assert_text "Ptclass was successfully updated"
    click_on "Back"
  end

  test "destroying a Ptclass" do
    visit ptclasses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ptclass was successfully destroyed"
  end
end
