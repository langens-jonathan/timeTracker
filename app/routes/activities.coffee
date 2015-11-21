`import Ember from 'ember'`

ActivitiesRoute = Ember.Route.extend
  beforeModel: ->
    @store.createRecord('activity-description', {
      description: 'Rijden Leuven-Genk'
    })
    @store.createRecord('activity-description', {
      description: 'Rijden Leuven-Tongeren'
    })
    @store.createRecord('activity-description', {
      description: 'Rijden Genk-Tongeren'
    })
    @store.createRecord('activity-description', {
      description: 'Leegmaken automaten'
    })
  model: ->
    @store.peekAll('activity-description')

  content: Ember.computed.alias 'model'

  updateModel: ->
    @set 'model', @store.peekAll('activity-description')

`export default ActivitiesRoute`
