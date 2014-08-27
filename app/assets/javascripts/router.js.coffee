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
