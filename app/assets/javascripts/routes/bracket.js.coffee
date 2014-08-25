App.BracketRoute = Ember.Route.extend
  model: ->
    @store.find 'game'
    #@store.find('game').then ( (games) ->
    # promises = games.map( (record) ->
    #   reload = record.reload()
    # reload.get('promise')
    # )
    # Ember.RSVP.all(promises).then ( (reloadedGames) ->
    #   return reloadedGames
    # )
    #)
  #setupController: (controller, model) ->
  # @_super(controller, model)
  # navbarController = @controllerFor("navbar")
  # navbarController.set("games", model)
    #promises = model.map( (record) ->
    #   reload = record.reload()
    #   reload.get('promise')
    #)
    #Ember.RSVP.all(promises).then( (reloadedGames, probablyAnError) ->
    # console.log("Stuff happens here maybe")
      #@_super(controller, reloadedGames)
      #navbarController = @controllerFor("navbar")
      #navbarController.set("games", reloadedGames)
   # ).then (stuff, more_stuff) ->
   #  console.log(stuff)

