class CardsController < ApplicationController
  def show
  end

  def list
    @cards = Cards.all

    respond_to do |format|
      format.html
    end
  end
end
