class ActionCard < ActiveRecord::Base
  belongs_to :game_instance
  belongs_to :hand

  def Load(name)
    self.json = File.read("cards/action/#{filename}.json"))
  end

  def InstanceAgainst(game)
    self.played = false
    self.discarded = false
    self.game_instance = game
  end
end
