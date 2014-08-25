class RemoveTeamIdsFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :team_1_id, :integer
    remove_column :games, :team_2_id, :integer
  end
end
