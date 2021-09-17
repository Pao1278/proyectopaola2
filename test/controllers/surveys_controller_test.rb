require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surveys_index_url
    assert_response :success
  end

  test "should get thankyou" do
    get surveys_thankyou_url
    assert_response :success
  end

  test "should get create" do
    get surveys_create_url
    assert_response :success
  end
end
