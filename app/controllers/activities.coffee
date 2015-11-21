`import Ember from 'ember'`

ActivitiesController = Ember.Controller.extend

  init: ->
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


  settingsService: Ember.inject.service('settings')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    'btn-large ' + @get('settingsService.activeColor') + ' darken -1'



  actions:
    deleteRow: (desc) ->
      Ember.Logger.log desc
      ads = @store.peekAll('activity-description')
      ads.forEach (item,i) ->
        if item.get('description') == desc
          item.destroyRecord()

    selectRow: (desc) ->
      Ember.Logger.log desc
      ads = @store.peekAll('activity-description')
      ads.forEach (item,i) ->
        item.set 'selected', false
        if item.get('description') == desc
          item.set 'selected', true

    addRow: () ->
      @transitionTo('activities/new')

`export default ActivitiesController`
