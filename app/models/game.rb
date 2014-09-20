class Game < ActiveRecord::Base
  has_many :cards
  has_many :players
  has_many :moves
  has_many :invitations
  belongs_to :user
  has_one :root_card, class_name: :Card

  require 'json'

  def Load
    deck_json = JSON.parse(File.read("#{Rails.root.to_s}/public/cards/#{self.deck}"))
    #Load root card
    card = Card.new({card_type: "path", name: deck_json["root"], game_id: self.id})
    card.Load()
    if !card.save()
      #Error
      return {status: "alert", message: "Failed to create root card"}
    end
    self.root_card = card

    #Instance other cards
    deck_json["cards"].each_pair do | type, collection |
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

  def is_invited?(user)
    invitations = Invitations.find(:all, conditions: {game_id: self.id, user_id: user.id})
    return invitations > 0
  end

  def rowstyle
    #Switch css styles based on relations
    if !current_user.nil?
      if current_user.id == game.user.id
        return "info"
      else
        if self.is_invited?(current_user)
          return "success"
        else
          if game.private
            if current_user.has_friend(self.user)
              return "warning"  
            else
              return "danger"
            end
          else
            #Shouldn't get here. Private games aren't listed
            return ""
          end
        end
      end
    end
  end
end
