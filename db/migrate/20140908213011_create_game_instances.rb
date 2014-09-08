class CreateGameInstances < ActiveRecord::Migration
  def change
    create_table :game_instances do |t|
      t.string :root_card
      t.string :deck_name
      t.integer :deck_id

      t.timestamps
    end
  end
end
