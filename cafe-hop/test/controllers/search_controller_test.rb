require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search_page" do
    get search_search_page_url
    assert_response :success
  end

end
