require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get mybookings" do
    get dashboards_mybookings_url
    assert_response :success
  end

  test "should get myvehicles" do
    get dashboards_myvehicles_url
    assert_response :success
  end

  test "should get myvehiclestobook" do
    get dashboards_myvehiclestobook_url
    assert_response :success
  end

end
