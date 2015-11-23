`import Ember from 'ember'`

HistoryEditController = Ember.Controller.extend

  originalActivityDescription: ""

  originalStartTime: undefined

  originalEndTime: undefined

  originalUser: ""

  originalExtraInformation: ""

  settingsService: Ember.inject.service('settings')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

  activityDescription: ""

  extraInformation: ""

  takeOverValuesFromRow: (row) ->
    @set 'originalActivityDescription', row.get('description')
    @set 'originalStartTime', row.get('startTime')
    @set 'originalEndTime', row.get('')
    @set 'originalExtraInformation', row.get('')
    @set 'originalUser', row.get('')
    @set 'activityDescription', row.get('description')
    @set 'startTime', row.get('startTime')
    @set 'endTime', row.get('endTime')
    @set 'extraInformation', row.get('extraInformation')

  actions:
    updateActivity: ->
      ads = @store.peekAll('activity')
      ads.forEach (item, i) =>
        unless item
          return
        if item.get('description') == @get('originalActivityDescription') and item.get('startTime') == @get('originalStartTime') and item.get('endTime') == @get('originalEndTime') and item.get('extraInfo') == @get('originalExtraInformation') and item.get('username') == @get('originalUser')
          item.set 'description', @get('activityDescription')
          item.set 'extraInfo', @get 'extraInformation'
      
      @transitionTo('history')

    cancel: ->
      @transitionTo('history')


`export default HistoryEditController`
