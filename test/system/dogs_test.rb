require "application_system_test_case"

class DogsTest < ApplicationSystemTestCase
  setup do
    @dog = dogs(:one)
  end

  test "visiting the index" do
    visit dogs_url
    assert_selector "h1", text: "Dogs"
  end

  test "creating a Dog" do
    visit dogs_url
    click_on "New Dog"

    fill_in "Allergies", with: @dog.allergies
    fill_in "Breed", with: @dog.breed
    fill_in "Canil", with: @dog.canil
    fill_in "Chip", with: @dog.chip
    fill_in "Color", with: @dog.color
    fill_in "Dob", with: @dog.dob
    fill_in "Name", with: @dog.name
    fill_in "Obs", with: @dog.obs
    fill_in "Sex", with: @dog.sex
    fill_in "Vaccines", with: @dog.vaccines
    fill_in "Weight", with: @dog.weight
    click_on "Create Dog"

    assert_text "Dog was successfully created"
    click_on "Back"
  end

  test "updating a Dog" do
    visit dogs_url
    click_on "Edit", match: :first

    fill_in "Allergies", with: @dog.allergies
    fill_in "Breed", with: @dog.breed
    fill_in "Canil", with: @dog.canil
    fill_in "Chip", with: @dog.chip
    fill_in "Color", with: @dog.color
    fill_in "Dob", with: @dog.dob
    fill_in "Name", with: @dog.name
    fill_in "Obs", with: @dog.obs
    fill_in "Sex", with: @dog.sex
    fill_in "Vaccines", with: @dog.vaccines
    fill_in "Weight", with: @dog.weight
    click_on "Update Dog"

    assert_text "Dog was successfully updated"
    click_on "Back"
  end

  test "destroying a Dog" do
    visit dogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dog was successfully destroyed"
  end
end
