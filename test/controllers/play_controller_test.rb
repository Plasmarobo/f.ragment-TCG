require 'test_helper'

class PlayControllerTest < ActionController::TestCase
  test "should get commit" do
    get :commit
    assert_response :success
  end

  test "should get board" do
    get :board
    assert_response :success
  end

end
