class CreateGoalCards < ActiveRecord::Migration
  def change
    create_table :goal_cards do |t|
      t.string :card_name
      t.integer :hand_id
      t.integer :deck_id
      t.integer :game_id

      t.timestamps
    end
  end
end
