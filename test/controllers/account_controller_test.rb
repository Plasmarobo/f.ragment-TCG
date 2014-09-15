require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get manage" do
    get :manage
    assert_response :success
  end

  test "should get friends" do
    get :friends
    assert_response :success
  end

end
