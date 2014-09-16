require 'test_helper'

class MoveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "move construct" do
    move = Move.new({game_id: 0, player_id: 0, card_id: 0, location: "0,0"})
    assert move.game_id == 0
    assert move.player_id == 0
    assert move.card_id == 0
    assert move.location == "0,0"
    move.save
    query = Move.find_by_game_id(0)
    assert query.game_id == 0
    assert query.player_id == 0
    assert query.card_id == 0
    assert query.location == "0,0"
  end

  test "move relations" do
    move = Move.all.first
    assert move.game.name == "BasicGame"
    assert move.player.user.name == "player1"
  end

end
