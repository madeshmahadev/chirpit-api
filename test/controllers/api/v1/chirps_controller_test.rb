require "test_helper"

class Api::V1::ChirpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_chirp = api_v1_chirps(:one)
  end

  test "should get index" do
    get api_v1_chirps_url, as: :json
    assert_response :success
  end

  test "should create api_v1_chirp" do
    assert_difference('Api::V1::Chirp.count') do
      post api_v1_chirps_url, params: { api_v1_chirp: { body: @api_v1_chirp.body, user_id: @api_v1_chirp.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_chirp" do
    get api_v1_chirp_url(@api_v1_chirp), as: :json
    assert_response :success
  end

  test "should update api_v1_chirp" do
    patch api_v1_chirp_url(@api_v1_chirp), params: { api_v1_chirp: { body: @api_v1_chirp.body, user_id: @api_v1_chirp.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_chirp" do
    assert_difference('Api::V1::Chirp.count', -1) do
      delete api_v1_chirp_url(@api_v1_chirp), as: :json
    end

    assert_response 204
  end
end
