class GoalCard < ActiveRecord::Base
  belongs_to :game_instance
  belongs_to :hand

end
