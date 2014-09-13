class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :root_card_id
      t.string :name
      t.string :deck

      t.timestamps
    end
  end
end
