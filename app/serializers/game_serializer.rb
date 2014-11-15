class GameSerializer < ActiveModel::Serializer
  attributes :id, :uniq_game_id, :bracket_id, :bracket_game_id, :winner_id, :in_bracket
  has_many :teams
end
