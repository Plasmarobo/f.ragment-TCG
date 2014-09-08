class CreateGoaldecks < ActiveRecord::Migration
  def change
    create_table :goaldecks do |t|
      t.integer :game_id

      t.timestamps
    end
  end
end
