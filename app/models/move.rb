class Move < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  has_one :card
end
