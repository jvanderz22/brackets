App.NavbarController = Ember.Controller.extend
  needs: "games"
  games: Ember.computed.alias 'controllers.games.content'
  inBracketGames: Ember.computed.filterBy("games", "inBracket", true)

  update: ( ->
    @set('games', @get('controllers.games.content'))
  ).observes('controllers.games.content.[]')

  totalGames: ( ->
    @get("inBracketGames").length
  ).property("inBracketGames")

  gamesWithWinners: ( ->
    @get("inBracketGames").filter (game) ->
      not (game.get("winnerId") == null || game.get("winnerId") == undefined)
  ).property("inBracketGames", 'games.content.[]')

  gamesPicked: ( ->
    @get("gamesWithWinners").length
  ).property("gamesWithWinners")
