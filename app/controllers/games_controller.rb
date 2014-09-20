class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:manage, :play, :delete]

  def new
    @game = Game.new
    @game.user = current_user
    Dir.chdir("#{Rails.root.to_s}/public/cards/") do
      @decks = Dir["*.json"]
    end
  end

  def create
    @game = Game.new(game_params)
    #Load also saves the deck
    result = @game.Load
    if result["status"] == "alert"
      alert = result["message"]
      render action: :new
    else
      redirect_to action: :manage, game: @game
    end
  end

  def manage
    @games = current_user.games
  end

  def update
  end

  def play
  end

  def delete
    if current_user.id == @game.user.id
      if params[:confirm] == "DELETE"
        name = @game.name
        @game.destroy
        redirect_to action: :manage, notice: "Deleted #{name}"
      end
    else
      redirect_to action: :manage, alert: "You do not own that game."
    end
  end

  def public
    @games = Game.find(:all, conditions: {"public" => true})
  end

  def friends
    #Determine each friend
    friend_ids = current_user.friends.collect {|friend| friend.id}
    @games = Games.where(user_id: friend_ids)
  end

  def admin
  end

  private 

  def game_params
    params.require(:game).permit(:name, :user_id, :root_card_id, :private, :deck)
  end

  def select_game
    @game = Game.find(params[:id])
  end
end
