class Move < ActiveRecord::Base
  has_one :game
  has_one :player
  has_one :card
end
