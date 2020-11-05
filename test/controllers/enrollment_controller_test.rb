require 'test_helper'

class EnrollmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enrollment_index_url
    assert_response :success
  end

end
