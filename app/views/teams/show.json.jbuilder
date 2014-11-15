json.team do
  json.partial! 'teams/team', team: @team
end

json.linked do
  json.games @games do |game|
    json.partial! 'games/game', game: game
  end
end
