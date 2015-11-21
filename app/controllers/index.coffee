`import Ember from 'ember'`

IndexController = Ember.Controller.extend

  init: ->
    @_super(arguments...)
    @setActivityDescriptions()

  setActivityDescriptions: ->
    # setting the activity descriptions
    ad = @store.peekAll('activity-description')
    ads = []
    ad.forEach (item,i) ->
      ads.push(item.get('description'))
    @set('activityDescriptions', ads)

  settingsService: Ember.inject.service('settings')

  activityTrackerService: Ember.inject.service('activity-tracker')

  buttonColor: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

  activityDescriptions: []

  activityDescription: Ember.computed.alias('activityTrackerService.description')

  startTime: Ember.computed.oneWay('activityTrackerService.startTime')

  endTime: Ember.computed.oneWay('activityTrackerService.endTime')

  trackingActivity: Ember.computed.oneWay('activityTrackerService.running')

  currentTime: Ember.computed 'activityTrackerService.startTime', 'activityTrackerService.endTime', 'activityTrackerService.running', ->
    if @get('activityTrackerService.running')
      "{0} hours and {0} minutes"
    else
      ""


`export default IndexController`
