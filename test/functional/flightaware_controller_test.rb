require 'test_helper'

class FlightawareControllerTest < ActionController::TestCase
  test "should get arivals" do
    get :arivals
    assert_response :success
  end

  test "should get departures" do
    get :departures
    assert_response :success
  end

  test "should get flightinfo" do
    get :flightinfo
    assert_response :success
  end

end
