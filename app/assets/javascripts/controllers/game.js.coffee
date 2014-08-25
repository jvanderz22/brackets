App.GameController = Ember.ObjectController.extend
  randomFirst: ( ->
    Math.floor(Math.random() * 2)
  ).property('content')
  randomSecond: ->
    if @get('randomFirst') == 1 then 0 else 1
  team1: Ember.computed 'teams', ->
    @get("teams").objectAt(@get('randomFirst'))
  team2:  Ember.computed 'teams', ->
    @get("teams").objectAt(@randomSecond())

  actions:
    pickWinner: (team)->
      game = @get('content')
      game.set("winnerId", team)
      game.save().then((data) =>
        data.get('winnerId').reload().then((data) =>
          data.get('gameId').reload().then((data) =>
            @transitionToRoute("games")
          )
        )
     )
