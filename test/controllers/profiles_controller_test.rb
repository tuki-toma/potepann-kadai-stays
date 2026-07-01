require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit,update" do
    get profiles_edit,update_url
    assert_response :success
  end
end
