require "test_helper"

class GroupmapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupmap = groupmaps(:one)
  end

  test "should get index" do
    get groupmaps_url
    assert_response :success
  end

  test "should get new" do
    get new_groupmap_url
    assert_response :success
  end

  test "should create groupmap" do
    assert_difference('Groupmap.count') do
      post groupmaps_url, params: { groupmap: { limit: @groupmap.limit, time: @groupmap.time } }
    end

    assert_redirected_to groupmap_url(Groupmap.last)
  end

  test "should show groupmap" do
    get groupmap_url(@groupmap)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupmap_url(@groupmap)
    assert_response :success
  end

  test "should update groupmap" do
    patch groupmap_url(@groupmap), params: { groupmap: { limit: @groupmap.limit, time: @groupmap.time } }
    assert_redirected_to groupmap_url(@groupmap)
  end

  test "should destroy groupmap" do
    assert_difference('Groupmap.count', -1) do
      delete groupmap_url(@groupmap)
    end

    assert_redirected_to groupmaps_url
  end
end
