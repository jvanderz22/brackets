# For more information see: http://emberjs.com/guides/routing/

App.Router.reopen
  rootURL: '/'


App.Router.map ()->
    @resource('games', ->
      @resource('game', { path: ':id'}, -> )
    )
    @resource('teams')
    @resource('bracket')
