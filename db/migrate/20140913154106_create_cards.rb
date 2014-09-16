class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :card_type
      t.string :name

      t.timestamps
    end
  end
end
