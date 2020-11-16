require 'test_helper'

class Admins::TestadminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_testadmin_new_url
    assert_response :success
  end

end
