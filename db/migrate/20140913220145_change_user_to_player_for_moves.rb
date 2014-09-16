class ChangeUserToPlayerForMoves < ActiveRecord::Migration
  def change
    rename_column :moves, :user_id, :player_id
  end
end
