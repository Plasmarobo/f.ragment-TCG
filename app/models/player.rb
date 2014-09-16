class Player < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  belongs_to :game, dependent: :destroy
end
