require "application_system_test_case"

class PincodesTest < ApplicationSystemTestCase
  setup do
    @pincode = pincodes(:one)
  end

  test "visiting the index" do
    visit pincodes_url
    assert_selector "h1", text: "Pincodes"
  end

  test "creating a Pincode" do
    visit pincodes_url
    click_on "New Pincode"

    fill_in "Pcode", with: @pincode.pcode
    fill_in "Username", with: @pincode.username
    click_on "Create Pincode"

    assert_text "Pincode was successfully created"
    click_on "Back"
  end

  test "updating a Pincode" do
    visit pincodes_url
    click_on "Edit", match: :first

    fill_in "Pcode", with: @pincode.pcode
    fill_in "Username", with: @pincode.username
    click_on "Update Pincode"

    assert_text "Pincode was successfully updated"
    click_on "Back"
  end

  test "destroying a Pincode" do
    visit pincodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pincode was successfully destroyed"
  end
end
