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
  model: -> @store.find 'game'

App.GameRoute = Ember.Route.extend
  model: (params) ->
    @store.getById 'game', params.id

App.TeamsRoute = Ember.Route.extend
  model: -> @store.find 'team'

App.BracketRoute = Ember.Route.extend
  model: -> @store.find 'game'
