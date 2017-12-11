require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_create_url
    assert_response :success
  end

end
