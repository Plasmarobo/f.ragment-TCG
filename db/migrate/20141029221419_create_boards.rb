class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :game_id
      t.integer :x
      t.integer :y
      t.integer :pc_x
      t.integer :pc_y

      t.timestamps
    end
  end
end
