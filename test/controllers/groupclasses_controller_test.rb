require "test_helper"

class GroupclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupclass = groupclasses(:one)
  end

  test "should get index" do
    get groupclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_groupclass_url
    assert_response :success
  end

  test "should create groupclass" do
    assert_difference('Groupclass.count') do
      post groupclasses_url, params: { groupclass: { class_date: @groupclass.class_date, grouptrain_id: @groupclass.grouptrain_id } }
    end

    assert_redirected_to groupclass_url(Groupclass.last)
  end

  test "should show groupclass" do
    get groupclass_url(@groupclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupclass_url(@groupclass)
    assert_response :success
  end

  test "should update groupclass" do
    patch groupclass_url(@groupclass), params: { groupclass: { class_date: @groupclass.class_date, grouptrain_id: @groupclass.grouptrain_id } }
    assert_redirected_to groupclass_url(@groupclass)
  end

  test "should destroy groupclass" do
    assert_difference('Groupclass.count', -1) do
      delete groupclass_url(@groupclass)
    end

    assert_redirected_to groupclasses_url
  end
end
