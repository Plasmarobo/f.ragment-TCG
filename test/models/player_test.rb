require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "player construct" do
    player = Player.new({game_id: 0, user_id: 0})
    assert player.game_id == 0
    assert player.user_id == 0
    player.save
    query = Player.find_by_game_id(0)
    assert query.game_id == 0
    assert query.user_id == 0
  end

  test "player relations" do
    player = Player.first
    player.user = User.first
    player.save
    player = Player.first
    assert player.user.name == User.first.name
    assert player.game.name == "BasicGame"
  end
end
