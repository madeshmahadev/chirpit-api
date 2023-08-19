require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_comment = api_v1_comments(:one)
  end

  test "should get index" do
    get api_v1_comments_url, as: :json
    assert_response :success
  end

  test "should create api_v1_comment" do
    assert_difference('Api::V1::Comment.count') do
      post api_v1_comments_url, params: { api_v1_comment: { api_v1_chirp_id: @api_v1_comment.api_v1_chirp_id, body: @api_v1_comment.body, user_id: @api_v1_comment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_comment" do
    get api_v1_comment_url(@api_v1_comment), as: :json
    assert_response :success
  end

  test "should update api_v1_comment" do
    patch api_v1_comment_url(@api_v1_comment), params: { api_v1_comment: { api_v1_chirp_id: @api_v1_comment.api_v1_chirp_id, body: @api_v1_comment.body, user_id: @api_v1_comment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_comment" do
    assert_difference('Api::V1::Comment.count', -1) do
      delete api_v1_comment_url(@api_v1_comment), as: :json
    end

    assert_response 204
  end
end
