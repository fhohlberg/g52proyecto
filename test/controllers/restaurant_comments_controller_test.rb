require 'test_helper'

class RestaurantCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_comment = restaurant_comments(:one)
  end

  test "should get index" do
    get restaurant_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_comment_url
    assert_response :success
  end

  test "should create restaurant_comment" do
    assert_difference('RestaurantComment.count') do
      post restaurant_comments_url, params: { restaurant_comment: { body: @restaurant_comment.body, client_id: @restaurant_comment.client_id, client_name: @restaurant_comment.client_name } }
    end

    assert_redirected_to restaurant_comment_url(RestaurantComment.last)
  end

  test "should show restaurant_comment" do
    get restaurant_comment_url(@restaurant_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_comment_url(@restaurant_comment)
    assert_response :success
  end

  test "should update restaurant_comment" do
    patch restaurant_comment_url(@restaurant_comment), params: { restaurant_comment: { body: @restaurant_comment.body, client_id: @restaurant_comment.client_id, client_name: @restaurant_comment.client_name } }
    assert_redirected_to restaurant_comment_url(@restaurant_comment)
  end

  test "should destroy restaurant_comment" do
    assert_difference('RestaurantComment.count', -1) do
      delete restaurant_comment_url(@restaurant_comment)
    end

    assert_redirected_to restaurant_comments_url
  end
end
