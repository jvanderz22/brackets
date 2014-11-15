json.games @games do |game|
  json.partial! 'games/game', game: game
end

json.linked do
  json.teams @teams do |team|
    json.partial! 'teams/team', team: team
  end
end

json.meta do
  json.averages @averages
end
