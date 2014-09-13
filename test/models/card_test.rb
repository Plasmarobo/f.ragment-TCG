require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "card construct" do
    card = Card.new({card_type: "path", user_id: 0, game_id: 0, name: "test_card"})
    assert card.card_type == "path"
    assert card.user_id == 0
    assert card.game_id == 0
    assert card.name == "test_card"
    assert card.save
    query = Card.find_by_name("test_card")
    assert query.card_type == "path"
    assert query.user_id == 0
    assert query.game_id == 0
    assert query.name == "test_card"
  end

  test "card load" do
    card = Card.new({card_type: "path", name: "command", json: ""})
    card.Load
    assert card.json != ""
  end

  test "card relations" do
    card = Card.find_by_name("delete")
    assert card.user.name == "magic"
    assert card.game.name == "BasicGame"
  end
end
