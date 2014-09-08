class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :game_id
      t.string :action
      t.string :player
      t.integer :sequence

      t.timestamps
    end
  end
end
