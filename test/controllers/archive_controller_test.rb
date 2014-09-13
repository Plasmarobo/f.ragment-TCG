require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get replay" do
    get :replay
    assert_response :success
  end

end
