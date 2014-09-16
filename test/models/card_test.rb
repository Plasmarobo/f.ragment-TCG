require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "card construct" do
    card = Card.new({card_type: "path", player_id: 0, game_id: 0, name: "test_card"})
    assert card.card_type == "path"
    assert card.player_id == 0
    assert card.game_id == 0
    assert card.name == "test_card"
    card.save
    query = Card.find_by_name("test_card")
    assert query.card_type == "path"
    assert query.player_id == 0
    assert query.game_id == 0
    assert query.name == "test_card"
  end

  test "card load" do
    card = Card.new({card_type: "path", name: "command"})
    #Loading should be implicit
    #card.Load
    assert card.getName == "Command"
    assert card.getFlavortext == "The lurking prompt"
    assert (not card.locked?)
    assert card.inject?
    assert card.push?
    assert card.getRule == "start_card"

  end

  test "card relations" do
    card = Card.find_by_name("delete")
    assert card.player.user.name == "magic"
    assert card.game.name == "BasicGame"
  end
  
end
