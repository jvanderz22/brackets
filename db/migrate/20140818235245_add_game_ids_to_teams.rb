class AddGameIdsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :games, :integer, array: true, default: []
    add_column :teams, :game_id, :integer
  end
end
