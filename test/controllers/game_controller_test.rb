require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get play" do
    get :play
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
