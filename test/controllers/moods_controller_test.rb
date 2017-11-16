require 'test_helper'

class MoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get moods_edit_url
    assert_response :success
  end

  test "should get index" do
    get moods_index_url
    assert_response :success
  end

  test "should get new" do
    get moods_new_url
    assert_response :success
  end

  test "should get show" do
    get moods_show_url
    assert_response :success
  end

end
