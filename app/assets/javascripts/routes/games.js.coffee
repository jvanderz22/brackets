App.GamesRoute = Ember.Route.extend
  model: ->
    @store.find 'game'


App.GamesIndexRoute = Ember.Route.extend
  model: -> @modelFor("games").toArray()
  setupController: (controller, model) ->
    @_super(controller, model)
    navbarController = @controllerFor("navbar")
    navbarController.set("games", @model())

App.GameRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'game', params.id
