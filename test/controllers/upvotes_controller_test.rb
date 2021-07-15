require "test_helper"

class UpvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get upvotes_create_url
    assert_response :success
  end
end
