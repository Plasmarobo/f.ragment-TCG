class ActionCard < ActiveRecord::Base

  def Load(name)
    self.json = File.read("cards/action/#{filename}.json"))
  end

  def InstanceAgainst(game)
    self.played = false
    self.discarded = false
    self.game = game
  end
end
