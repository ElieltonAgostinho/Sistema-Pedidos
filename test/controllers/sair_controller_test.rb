require "test_helper"

class SairControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sair_index_url
    assert_response :success
  end
end
