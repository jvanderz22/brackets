App.BracketController = Ember.ArrayController.extend
  transitionToGames: ( ->
    games = @get('content.content')
    return if games is null or games is undefined
    if games.filterBy('isAvailable').length > 0 || games.length != 127
      @transitionToRoute('games')
  ).on('init').observes('content')

  _orderedInBracketGames: (games) ->
    inBracketGames = games.filterBy('inBracket', true)
    inBracketGames.sortBy('bracketId', 'bracketGameId')

  _gamesBetween: (games, lowNum, highNum) ->
    games.filter (game) ->
      bracketGameId = game.get('bracketGameId')
      bracketGameId >= lowNum && bracketGameId <= highNum

  _finalFourGames: (games) ->
    @_gamesBetween(games, 0, 1).filter (game) ->
      game.get('bracketId') == 4

  _championshipGame: (games) ->
    games.filter (game) ->
      game.get('bracketId') == 4 && game.get('bracketGameId') == 2

  _mappedTeams: (teams, winner) ->
    teams = teams.content.uniq()
    if teams.length == 2
      sortedTeams = teams.sortBy('seed')
      sortedTeams.map (team) -> "#{team.get('seed')} #{team.get('school')}"
    else
      teams.push(winner)
      sortedTeams = teams.sortBy('seed')
      sortedTeams.map (team) -> "#{team.get('seed')} #{team.get('school')}"

  _mappedGames: (games) ->
    games.map (game) =>
      @_mappedTeams(game.get('teams'), game.get('winnerId'))

   teams: ( ->
    allGames = @get('content.content')
    orderedGames = @_orderedInBracketGames(allGames)
    secondRoundGames = @_gamesBetween(orderedGames, 16, 23)
    @_mappedGames(secondRoundGames)
  ).property('content.isLoaded')

  _gameResults: (game) ->
    winnerPos = parseInt(game.get('winnerId').get('pos'))
    loserArray = game.get('teams').filter (team) ->
      team.get('id') != game.get('winnerId').get('id')
    loserPos = parseInt(loserArray.objectAt(0).get('pos'))
    if winnerPos > loserPos then [1, 2] else [2, 1]

  _roundResults: (roundGames) ->
    roundGames.map (game) =>
      @_gameResults(game)

  _allGameResults: (games) ->
    secondRoundGames = @_gamesBetween(games, 16, 23)
    thirdRoundGames = @_gamesBetween(games, 24, 27)
    fourthRoundGames = @_gamesBetween(games, 28, 29)
    fifthRoundGames = @_gamesBetween(games, 30, 30)
    sixthRoundGames = @_finalFourGames(games)
    seventhRoundGames = @_championshipGame(games)
    [@_roundResults(secondRoundGames), @_roundResults(thirdRoundGames),
      @_roundResults(fourthRoundGames), @_roundResults(fifthRoundGames),
      @_roundResults(sixthRoundGames), @_roundResults(seventhRoundGames)]

  results: ( ->
    allResults = []
    allGames = @get('content.content')
    orderedGames = @_orderedInBracketGames(allGames)
    @_allGameResults(orderedGames)
  ).property('content')


