json.array!(@games) do |game|
  json.extract! game, :id, :id, :uniq_game_id, :bracket_id, :bracket_game_id, :teams, :winner_id, :in_bracket
  json.url game_url(game, format: :json)
end
