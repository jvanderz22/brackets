App.ApplicationSerializer = DS.RESTSerializer.extend
  keyForAttribute: (key) ->
    decamelized = Ember.String.decamelize(key)
    decamelized.replace /(\d+)/, '_$1'
  keyForRelationship: (key, relationship) ->
    decamelized = Ember.String.decamelize(key)
    decamelized.replace /(\d+)/, '_$1'
  normalizePayload: (payload) ->
    for key, value of payload.linked
      payload[key] = value
    for key, value of payload.meta
      payload[key] = value
    delete payload.linked if payload.linked?
    delete payload.meta if payload.meta?
    payload

App.TeamSerializer = App.ApplicationSerializer.extend(
  normalizeHash:
    teams: (hash) ->
      hash.games = hash.games_won_ids
      delete hash.games_won_ids
      return hash
)



App.GameSerializer = App.ApplicationSerializer.extend
  normalizeHash:
    game: (hash) ->
      hash.teams = hash.team_ids
      delete hash.team_ids
      return hash
    games: (hash) ->
      hash.teams = hash.teams_ids
      delete hash.team_ids
      return hash
