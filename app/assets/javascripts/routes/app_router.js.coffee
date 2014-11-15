# For more information see: http://emberjs.com/guides/routing/

App.Router.reopen
  rootURL: '/'

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('games')

App.Router.map ()->
    @resource('games', ->
      @resource('game', { path: ':id'}, -> )
    )
    @resource('teams')
    @resource('bracket')

App.GamesRoute = Ember.Route.extend
  model: ->
    @store.findAll 'game'

  #afterModel: (games, transition) ->
  # @controllerFor('games').changeGame()
  #setupController: (controller, model) ->
  # @_super(controller, model)
  # navbarController = @controllerFor("navbar")
  # navbarController.set("games", @model())

App.GameRoute = Ember.Route.extend
  model: (params) ->
    @store.getById 'game', params.id

App.TeamsRoute = Ember.Route.extend
  model: -> @store.find 'team'

App.BracketRoute = Ember.Route.extend
  afterModel: (games, transition) ->
    if games.filterBy('isAvailable').length > 0 || games.get('content.length') != 127
      @transitionTo('games')

  model: ->
    @store.find 'game'

