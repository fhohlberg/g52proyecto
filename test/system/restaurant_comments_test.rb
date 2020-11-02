require "application_system_test_case"

class RestaurantCommentsTest < ApplicationSystemTestCase
  setup do
    @restaurant_comment = restaurant_comments(:one)
  end

  test "visiting the index" do
    visit restaurant_comments_url
    assert_selector "h1", text: "Restaurant Comments"
  end

  test "creating a Restaurant comment" do
    visit restaurant_comments_url
    click_on "New Restaurant Comment"

    fill_in "Body", with: @restaurant_comment.body
    fill_in "Client", with: @restaurant_comment.client_id
    fill_in "Client name", with: @restaurant_comment.client_name
    click_on "Create Restaurant comment"

    assert_text "Restaurant comment was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant comment" do
    visit restaurant_comments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @restaurant_comment.body
    fill_in "Client", with: @restaurant_comment.client_id
    fill_in "Client name", with: @restaurant_comment.client_name
    click_on "Update Restaurant comment"

    assert_text "Restaurant comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant comment" do
    visit restaurant_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant comment was successfully destroyed"
  end
end
