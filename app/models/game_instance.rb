class GameInstance < ActiveRecord::Base
  require 'json'
  
  def InstanceDeck(deck_json)
    deck = JSON.parse(deck_json)
    #Read Command Card
    
  end
end
