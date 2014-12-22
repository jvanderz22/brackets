App.GameController = Ember.ObjectController.extend
  needs: ['games', 'navbar']

  average: ( ->
    @store.metadataFor('game').averages
  ).property('content')

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
      game.save().then (game) =>
        game.get('winnerId').reload().then (data) =>
          data.get('gameId').reload().then (data) =>
            @controllerFor('games').changeGame()
            #this is bad and stupid but observing on the navbar directly seems to be not working :/
            @get('contollers.navbar').update()

