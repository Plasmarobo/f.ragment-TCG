class Invitation < ActiveRecord::Base
  belongs_to :game
  has_one :user
end
