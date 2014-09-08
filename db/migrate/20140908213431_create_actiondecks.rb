class CreateActiondecks < ActiveRecord::Migration
  def change
    create_table :actiondecks do |t|
      t.integer :game_id

      t.timestamps
    end
  end
end
