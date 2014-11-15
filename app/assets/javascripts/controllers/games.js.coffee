App.GamesController = Ember.ArrayController.extend
  games: Ember.computed.alias 'content.content'

  changeGame: ( ->
    games = @get('games').filterBy('isAvailable', true)
    index = Math.floor(Math.random() * games.length)
    randomGame = games.objectAt(index)
    if randomGame == null || randomGame == undefined
      @transitionTo('bracket')
    else
      @replaceWith('game', randomGame)
  ).observes('content.isLoaded')

