App.NavbarController = Ember.Controller.extend
  needs: "games"
  inBracketGames: Ember.computed.filterBy("games", "inBracket", true)

  totalGames: ( ->
    @get("inBracketGames").length
  ).property("inBracketGames")

  gamesWithWinners: ( ->
    @get("inBracketGames").filter (game) ->
      if game.get("winnerId") == null || game.get("winnerId") == undefined
        false
      else
        true
  ).property("inBracketGames")

  gamesPicked: ( ->
    @get("gamesWithWinners").length
  ).property("gamesWithWinners")
