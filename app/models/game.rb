class Game < ActiveRecord::Base
  has_many :cards
  has_many :players
  has_many :moves
  belongs_to :user
  has_one :root_card, class_name: :Card

  require 'json'

  def Load
    deck_json = JSON.Parse(File.read("cards/#{self.deck}.json"))
    #Load root card
    card = Card.new({card_type: :path})
    card.name = deck_json.root
    card.game = self
    card.Load()
    if !card.save()
      #Error
      return {status: "alert", message: "Failed to create root card"}
    end
    self.root_card = card

    #Instance other cards
    deck_json.cards.each_pair do | type, collection |
      collection.each do | card_name, count |
        card = Card.new({card_type: type})
        card.name = card_name
        card.game = self
        card.Load()
        count.times do 
          if !card.save()
            #Error
            return {status: "alert", message: "Failed to save card: #{card_name}"}
          end
          card = card.dup
        end
      end
    end 
    if self.save()
      return {status: "success", message: "Successfully updated #{self.name}"}
    else
      return {status: "alert", message: "Failed to update #{self.name}"}
    end
  end
end
