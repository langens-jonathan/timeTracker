`import Ember from 'ember'`

ActivitiesController = Ember.Controller.extend

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
