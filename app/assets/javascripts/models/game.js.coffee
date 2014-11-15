# for more details see: http://emberjs.com/guides/models/defining-models/

App.Game = DS.Model.extend
 # id: DS.attr 'number'
  uniqGameId: DS.attr 'number'
  bracketId: DS.attr 'number'
  bracketGameId: DS.attr 'number'
  teams: DS.hasMany 'team', { inverse: 'gameId' }
  winnerId: DS.belongsTo 'team', { inverse: 'gamesWonIds' }
  inBracket: DS.attr 'boolean'
  isAvailable: Ember.computed 'teams', 'winnerId', ->
    @get('teams').content.length == 2 && @get('winnerId') == null

