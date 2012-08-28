require 'test_helper'

class MailerControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get activate" do
    get :activate
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
