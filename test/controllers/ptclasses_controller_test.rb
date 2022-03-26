require "test_helper"

class PtclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ptclass = ptclasses(:one)
  end

  test "should get index" do
    get ptclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_ptclass_url
    assert_response :success
  end

  test "should create ptclass" do
    assert_difference('Ptclass.count') do
      post ptclasses_url, params: { ptclass: { class_date: @ptclass.class_date, dog_id: @ptclass.dog_id, obs: @ptclass.obs } }
    end

    assert_redirected_to ptclass_url(Ptclass.last)
  end

  test "should show ptclass" do
    get ptclass_url(@ptclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_ptclass_url(@ptclass)
    assert_response :success
  end

  test "should update ptclass" do
    patch ptclass_url(@ptclass), params: { ptclass: { class_date: @ptclass.class_date, dog_id: @ptclass.dog_id, obs: @ptclass.obs } }
    assert_redirected_to ptclass_url(@ptclass)
  end

  test "should destroy ptclass" do
    assert_difference('Ptclass.count', -1) do
      delete ptclass_url(@ptclass)
    end

    assert_redirected_to ptclasses_url
  end
end
