`import Ember from 'ember'`

ActivitiesRoute = Ember.Route.extend

  model: ->
    @store.peekAll('activity-description')

  content: Ember.computed.alias 'model'

  updateModel: ->
    @set 'model', @store.peekAll('activity-description')

`export default ActivitiesRoute`
