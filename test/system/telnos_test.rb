require "application_system_test_case"

class TelnosTest < ApplicationSystemTestCase
  setup do
    @telno = telnos(:one)
  end

  test "visiting the index" do
    visit telnos_url
    assert_selector "h1", text: "Telnos"
  end

  test "creating a Telno" do
    visit telnos_url
    click_on "New Telno"

    fill_in "Name", with: @telno.name
    fill_in "Owner", with: @telno.owner
    fill_in "Telno", with: @telno.telno
    click_on "Create Telno"

    assert_text "Telno was successfully created"
    click_on "Back"
  end

  test "updating a Telno" do
    visit telnos_url
    click_on "Edit", match: :first

    fill_in "Name", with: @telno.name
    fill_in "Owner", with: @telno.owner
    fill_in "Telno", with: @telno.telno
    click_on "Update Telno"

    assert_text "Telno was successfully updated"
    click_on "Back"
  end

  test "destroying a Telno" do
    visit telnos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Telno was successfully destroyed"
  end
end
