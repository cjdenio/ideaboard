require "test_helper"

class IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get ideas_list_url
    assert_response :success
  end
end
