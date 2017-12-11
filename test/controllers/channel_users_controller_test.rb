require 'test_helper'

class ChannelUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel_user = channel_users(:one)
  end

  test "should get index" do
    get channel_users_url
    assert_response :success
  end

  test "should get new" do
    get new_channel_user_url
    assert_response :success
  end

  test "should create channel_user" do
    assert_difference('ChannelUser.count') do
      post channel_users_url, params: { channel_user: { channel_id: @channel_user.channel_id, user_id: @channel_user.user_id } }
    end

    assert_redirected_to channel_user_url(ChannelUser.last)
  end

  test "should show channel_user" do
    get channel_user_url(@channel_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_channel_user_url(@channel_user)
    assert_response :success
  end

  test "should update channel_user" do
    patch channel_user_url(@channel_user), params: { channel_user: { channel_id: @channel_user.channel_id, user_id: @channel_user.user_id } }
    assert_redirected_to channel_user_url(@channel_user)
  end

  test "should destroy channel_user" do
    assert_difference('ChannelUser.count', -1) do
      delete channel_user_url(@channel_user)
    end

    assert_redirected_to channel_users_url
  end
end
