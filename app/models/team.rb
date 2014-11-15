class Team < ActiveRecord::Base
  belongs_to :game
  has_many :games,  foreign_key: "winner_id"

  alias_attribute :games_won_ids, :game_ids
end
