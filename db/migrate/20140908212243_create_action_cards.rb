class CreateActionCards < ActiveRecord::Migration
  def change
    create_table :action_cards do |t|
      t.boolean :played
      t.boolean :discarded
      t.integer :hand_id
      t.string :card_name
      t.integer :deck_id

      t.timestamps
    end
  end
end
