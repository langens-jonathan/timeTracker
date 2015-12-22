`import Ember from 'ember'`

SpreadsheetsRoute = Ember.Route.extend

  model: ->
    @store.findAll('file')

`export default SpreadsheetsRoute`
