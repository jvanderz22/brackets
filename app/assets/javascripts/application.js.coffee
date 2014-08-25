#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require ember-bootstrap/all
#= require lib/jquery.bracket.min.js
#= require_self
#= require kenpom

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create
  rootElement: "#ember-app"
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true


