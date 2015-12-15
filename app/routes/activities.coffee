`import Ember from 'ember'`

ActivitiesRoute = Ember.Route.extend

  settingsService: Ember.inject.service('settings')

  model: ->
    @store.findAll('activity-description').then( (records) =>
      ss = @get('settingsService')
      model = Ember.A()
      records.forEach (item,i) ->
        if(Ember.get(item, 'username') == ss.get('username'))
          model.push(item)
      model
      )

  content: Ember.computed.alias 'model'

  updateModel: ->
    @set 'model', @store.findAll('activity-description')

`export default ActivitiesRoute`
