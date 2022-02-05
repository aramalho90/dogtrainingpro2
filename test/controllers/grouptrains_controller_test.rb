require "test_helper"

class GrouptrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grouptrain = grouptrains(:one)
  end

  test "should get index" do
    get grouptrains_url
    assert_response :success
  end

  test "should get new" do
    get new_grouptrain_url
    assert_response :success
  end

  test "should create grouptrain" do
    assert_difference('Grouptrain.count') do
      post grouptrains_url, params: { grouptrain: { inscr_paid: @grouptrain.inscr_paid, status: @grouptrain.status, teoric1: @grouptrain.teoric1, teoric2: @grouptrain.teoric2, teoric_paid: @grouptrain.teoric_paid } }
    end

    assert_redirected_to grouptrain_url(Grouptrain.last)
  end

  test "should show grouptrain" do
    get grouptrain_url(@grouptrain)
    assert_response :success
  end

  test "should get edit" do
    get edit_grouptrain_url(@grouptrain)
    assert_response :success
  end

  test "should update grouptrain" do
    patch grouptrain_url(@grouptrain), params: { grouptrain: { inscr_paid: @grouptrain.inscr_paid, status: @grouptrain.status, teoric1: @grouptrain.teoric1, teoric2: @grouptrain.teoric2, teoric_paid: @grouptrain.teoric_paid } }
    assert_redirected_to grouptrain_url(@grouptrain)
  end

  test "should destroy grouptrain" do
    assert_difference('Grouptrain.count', -1) do
      delete grouptrain_url(@grouptrain)
    end

    assert_redirected_to grouptrains_url
  end
end
