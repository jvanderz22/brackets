class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :uniq_game_id
      t.integer :bracket_id
      t.integer :bracket_game_id
      t.integer :team_1_id
      t.integer :team_2_id
      t.integer :winner_id
      t.boolean :in_bracket

      t.timestamps
    end
  end
end
