class CreatePlayerInstances < ActiveRecord::Migration
  def change
    create_table :player_instances do |t|
      t.integer :user_id
      t.integer :hand_id

      t.timestamps
    end
  end
end
