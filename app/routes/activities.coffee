`import Ember from 'ember'`

ActivitiesRoute = Ember.Route.extend

  model: ->
    @store.findAll('activity-description')

  content: Ember.computed.alias 'model'

  updateModel: ->
    @set 'model', @store.findAll('activity-description')

`export default ActivitiesRoute`
