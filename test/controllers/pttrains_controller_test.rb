require "test_helper"

class PttrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pttrain = pttrains(:one)
  end

  test "should get index" do
    get pttrains_url
    assert_response :success
  end

  test "should get new" do
    get new_pttrain_url
    assert_response :success
  end

  test "should create pttrain" do
    assert_difference('Pttrain.count') do
      post pttrains_url, params: { pttrain: { inscr_paid: @pttrain.inscr_paid, obs: @pttrain.obs, status: @pttrain.status, test1: @pttrain.test1, test2: @pttrain.test2, test3: @pttrain.test3, test4: @pttrain.test4 } }
    end

    assert_redirected_to pttrain_url(Pttrain.last)
  end

  test "should show pttrain" do
    get pttrain_url(@pttrain)
    assert_response :success
  end

  test "should get edit" do
    get edit_pttrain_url(@pttrain)
    assert_response :success
  end

  test "should update pttrain" do
    patch pttrain_url(@pttrain), params: { pttrain: { inscr_paid: @pttrain.inscr_paid, obs: @pttrain.obs, status: @pttrain.status, test1: @pttrain.test1, test2: @pttrain.test2, test3: @pttrain.test3, test4: @pttrain.test4 } }
    assert_redirected_to pttrain_url(@pttrain)
  end

  test "should destroy pttrain" do
    assert_difference('Pttrain.count', -1) do
      delete pttrain_url(@pttrain)
    end

    assert_redirected_to pttrains_url
  end
end
