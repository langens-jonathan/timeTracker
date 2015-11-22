`import Ember from 'ember'`

HistoryController = Ember.Controller.extend
		  
  settingsService: Ember.inject.service('settings')

  activityTrackerService: Ember.inject.service('activity-tracker')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

`export default HistoryController`
