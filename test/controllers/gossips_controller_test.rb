require "test_helper"

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index_gossips" do
    get gossips_index_gossips_url
    assert_response :success
  end

  test "should get new_gossips" do
    get gossips_new_gossips_url
    assert_response :success
  end

  test "should get show_gossips" do
    get gossips_show_gossips_url
    assert_response :success
  end
end
