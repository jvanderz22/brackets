App.DataBracketComponent = Ember.Component.extend
  initPlugin: ( ->
    teams = @get('teams')
    results = @get('results')
    @$().bracket({
      skipConsolationRound: true
      init: {
        teams: teams
        results: results
        #'teams': [
        # ["Team1", "Team2"],
        # ["Team3", "Team4"]
       # ]
       # 'results': [
       #  [
       #    [
       #      [2,1],
       #      [3, 4]
       #    ],
       #    [
       #      [5, 6]
       #    ]
       #  ]
       #]
      }
    })
  ).on('didInsertElement')

