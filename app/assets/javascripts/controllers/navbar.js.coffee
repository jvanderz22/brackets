App.NavbarController = Ember.Controller.extend
  needs: "games"
  games: Ember.computed.alias 'controllers.games.content'
  inBracketGames: Ember.computed.filterBy("games", "inBracket", true)

  totalGames: ( ->
    @get("inBracketGames").length
  ).property("inBracketGames")

  gamesWithWinners: ( ->
    @get("inBracketGames").filter (game) ->
      not (game.get("winnerId") == null || game.get("winnerId") == undefined)
  ).property("inBracketGames", 'games.@each.winnerId')

  gamesPicked: ( ->
    @get("gamesWithWinners").length
  ).property("gamesWithWinners")
