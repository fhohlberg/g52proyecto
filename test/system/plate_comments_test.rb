require "application_system_test_case"

class PlateCommentsTest < ApplicationSystemTestCase
  setup do
    @plate_comment = plate_comments(:one)
  end

  test "visiting the index" do
    visit plate_comments_url
    assert_selector "h1", text: "Plate Comments"
  end

  test "creating a Plate comment" do
    visit plate_comments_url
    click_on "New Plate Comment"

    fill_in "Body", with: @plate_comment.body
    click_on "Create Plate comment"

    assert_text "Plate comment was successfully created"
    click_on "Back"
  end

  test "updating a Plate comment" do
    visit plate_comments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @plate_comment.body
    click_on "Update Plate comment"

    assert_text "Plate comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Plate comment" do
    visit plate_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plate comment was successfully destroyed"
  end
end
