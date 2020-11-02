require 'test_helper'

class PlateCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plate_comment = plate_comments(:one)
  end

  test "should get index" do
    get plate_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_plate_comment_url
    assert_response :success
  end

  test "should create plate_comment" do
    assert_difference('PlateComment.count') do
      post plate_comments_url, params: { plate_comment: { body: @plate_comment.body } }
    end

    assert_redirected_to plate_comment_url(PlateComment.last)
  end

  test "should show plate_comment" do
    get plate_comment_url(@plate_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_plate_comment_url(@plate_comment)
    assert_response :success
  end

  test "should update plate_comment" do
    patch plate_comment_url(@plate_comment), params: { plate_comment: { body: @plate_comment.body } }
    assert_redirected_to plate_comment_url(@plate_comment)
  end

  test "should destroy plate_comment" do
    assert_difference('PlateComment.count', -1) do
      delete plate_comment_url(@plate_comment)
    end

    assert_redirected_to plate_comments_url
  end
end
