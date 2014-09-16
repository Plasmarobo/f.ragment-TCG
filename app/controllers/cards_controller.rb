class CardsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def list
    @cards = Card.all

    respond_to do |format|
      format.html
    end
  end
end
