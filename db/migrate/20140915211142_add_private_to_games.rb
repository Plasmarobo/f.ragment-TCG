class AddPrivateToGames < ActiveRecord::Migration
  def change
    add_column :games, :private, :boolean
  end
end
