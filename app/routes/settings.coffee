`import Ember from 'ember'`

SettingsRoute = Ember.Route.extend

  model: ->
    settings = @store.peekAll('setting')
    model = undefined
    settings.forEach (item, it) ->
      model = item
    model

  afterModel: ->
    m = 3

`export default SettingsRoute`
