# for more details see: http://emberjs.com/guides/models/defining-models/

App.Game = DS.Model.extend
 # id: DS.attr 'number'
  uniqGameId: DS.attr 'number'
  bracketId: DS.attr 'number'
  bracketGameId: DS.attr 'number'
  teams: DS.hasMany 'team', { inverse: 'gameId' }
  winnerId: DS.belongsTo 'team', { inverse: 'gameIds' }
  inBracket: DS.attr 'boolean'
  isAvailable: Ember.computed 'teams', 'winnerId', ->
    if @get('teams').content.length == 2 && @get('winnerId') == null
      true
    else
      false
