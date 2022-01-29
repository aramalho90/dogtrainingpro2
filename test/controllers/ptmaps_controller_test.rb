require "test_helper"

class PtmapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ptmap = ptmaps(:one)
  end

  test "should get index" do
    get ptmaps_url
    assert_response :success
  end

  test "should get new" do
    get new_ptmap_url
    assert_response :success
  end

  test "should create ptmap" do
    assert_difference('Ptmap.count') do
      post ptmaps_url, params: { ptmap: { day: @ptmap.day, limit: @ptmap.limit } }
    end

    assert_redirected_to ptmap_url(Ptmap.last)
  end

  test "should show ptmap" do
    get ptmap_url(@ptmap)
    assert_response :success
  end

  test "should get edit" do
    get edit_ptmap_url(@ptmap)
    assert_response :success
  end

  test "should update ptmap" do
    patch ptmap_url(@ptmap), params: { ptmap: { day: @ptmap.day, limit: @ptmap.limit } }
    assert_redirected_to ptmap_url(@ptmap)
  end

  test "should destroy ptmap" do
    assert_difference('Ptmap.count', -1) do
      delete ptmap_url(@ptmap)
    end

    assert_redirected_to ptmaps_url
  end
end
