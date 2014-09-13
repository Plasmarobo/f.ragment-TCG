class Player < ActiveRecord::Base
  has_one :user
  belongs_to :game, dependent: :destroy
end
