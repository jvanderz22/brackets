App.TeamsRoute = Ember.Route.extend
  model: -> @store.find 'team'
