require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "game construct" do
    game = Game.new({user_id: 0, root_card_id: 0, name: "game_name", deck: "magic"})
    assert game.user_id == 0
    assert game.root_card_id == 0
    assert game.name == "game_name"
    assert game.deck == "magic"
    game.save
    query = Game.find_by_name("game_name")
    assert query.user_id == 0
    assert game.root_card_id == 0
    assert game.name == "game_name"
    assert game.deck == "magic"
  end

  test "game relations" do
    game = Game.find_by_name("BasicGame")
    card = Card.first
    game.root_card = card
    game.save
    game = Game.find_by_name("BasicGame")
    assert game.user.name == "magic"
    assert game.root_card.name == Card.first.name
    assert game.players.count == 3
    assert game.cards.count == 4
    assert game.moves.count == 1
  end

end
