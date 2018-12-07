require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get post_page" do
    get post_post_page_url
    assert_response :success
  end

end
