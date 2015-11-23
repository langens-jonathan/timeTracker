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
        if item.get('description') == row.get('description') and item.get('startTime') == row.get('startTime') and item.get('endTime') == row.get('endTime') and item.get('extraInformation') == row.get('extraInformation') and item.get('username') == row.get('username')
          item.destroyRecord()

    editRow: (row) ->
      erc = @get('container').lookup('controller:history/edit')

      erc.takeOverValuesFromRow(row)

      @transitionTo('history/edit')

`export default HistoryController`
