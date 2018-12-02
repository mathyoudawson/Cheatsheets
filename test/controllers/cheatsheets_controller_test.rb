require 'test_helper'

class CheatsheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cheatsheets_index_url
    assert_response :success
  end

end
