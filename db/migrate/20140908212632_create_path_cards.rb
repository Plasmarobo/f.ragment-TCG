class CreatePathCards < ActiveRecord::Migration
  def change
    create_table :path_cards do |t|
      t.boolean :played
      t.boolean :discarded
      t.boolean :flipped
      t.boolean :locked
      t.integer :hand_id
      t.string :card_name
      t.integer :deck_id
      t.integer :game_id
      t.integer :up_slot
      t.integer :down_slot
      t.integer :left_slot
      t.integer :right_slot

      t.timestamps
    end
  end
end
