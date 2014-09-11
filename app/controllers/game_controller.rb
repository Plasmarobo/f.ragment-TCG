class GameController < ApplicationController
  before_action :set_game, except: [:new]
  #before_action :validate_user
  
  def new
    @game = Game.new(game_params)
    #Create new decks
    deck_json = File.read("cards/#{@game.deck_name}.json")
    @game.InstanceDeck(deck_json)
    
  end

  def play
  end

  def view
  end

  private
    def game_params
      params.require(:settings).permit(:name, :owner, :deck_name, :root_card)
    end
end
