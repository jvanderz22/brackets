class AddTeamsToGame < ActiveRecord::Migration
  def change
    add_column :games, :teams, :integer, array: true, default: []
  end
end
