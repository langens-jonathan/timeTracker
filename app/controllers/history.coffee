`import Ember from 'ember'`

HistoryController = Ember.Controller.extend
		  
  settingsService: Ember.inject.service('settings')

  activityTrackerService: Ember.inject.service('activity-tracker')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

  actions:
    addRow: ->
      @transitionTo('history/new')

    deleteRow: (row) ->
      ads = @store.peekAll('activity')
      ads.forEach (item, i) ->
        if item.get('id') == row.get('id')
          item.destroyRecord()

    editRow: (row) ->
      erc = @get('container').lookup('controller:history/edit')

      erc.takeOverValuesFromRow(row)

      @transitionTo('history/edit')

    selectRow: (row) ->
      ads = @store.peekAll('activity')
      ads.forEach (item,i) ->
        item.set 'selected', false
        if item.get('id') == row.get('id')
          item.set 'selected', true

`export default HistoryController`
