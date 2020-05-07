class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.integer :tick
      t.string :img
      t.integer :game_id

      t.timestamps
    end
  end
end
