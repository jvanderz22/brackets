App.ApplicationController = Ember.ObjectController.extend
  needs: ['navbar']
  initNavbar:( ->
    @store.findAll('game').then (games) =>
      @get('controllers.navbar').set('games', games)
  ).on('init')
