require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get manage" do
    get :manage
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get public" do
    get :public
    assert_response :success
  end

  test "should get friends" do
    get :friends
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
