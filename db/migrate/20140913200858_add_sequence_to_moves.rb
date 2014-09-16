class AddSequenceToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :sequence, :integer
    add_index :moves, :sequence
  end
end
