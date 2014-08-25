class Team < ActiveRecord::Base
  belongs_to :game
  has_many :games,  foreign_key: "winner_id"
end
