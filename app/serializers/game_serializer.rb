class GameSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :uniq_game_id, :bracket_id, :bracket_game_id, :winner_id, :in_bracket
  has_many :teams
end
