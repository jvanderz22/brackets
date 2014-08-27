App.DataBracketComponent = Ember.Component.extend
  initPlugin: ( ->
    teams = @get('teams')
    results = @get('results')
    @$().bracket({
      skipConsolationRound: true
      init: {
        teams: teams
        results: results
      }
    })
  ).on('didInsertElement')

