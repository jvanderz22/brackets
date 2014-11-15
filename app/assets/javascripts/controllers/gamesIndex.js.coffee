App.GamesController = Ember.ArrayController.extend
  changeGame: ( ->
    games = @get('content').filterBy('isAvailable', true)
    index = Math.floor(Math.random() * games.length)
    randomGame = games.objectAt(index)
    if randomGame == null || randomGame == undefined
      @transitionTo('bracket')
    else
      @replaceWith('game', randomGame)
  ).observes('content.[]')

