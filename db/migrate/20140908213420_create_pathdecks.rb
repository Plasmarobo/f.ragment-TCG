class CreatePathdecks < ActiveRecord::Migration
  def change
    create_table :pathdecks do |t|
      t.integer :game_id

      t.timestamps
    end
  end
end
