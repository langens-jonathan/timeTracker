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

  extractHours: (time) ->
    time = time / (60 * 1000) # get the time in minutes
    time % 60

  extractMinutes: (time) ->
    time = time / 1000 # get the time in seconds
    time % 60

  currentTime: Ember.computed 'activityTrackerService.startTime', 'activityTrackerService.endTime', 'activityTrackerService.running', ->
    @calculateCurrentTime()

  calculateCurrentTime: ->
    if @get('activityTrackerService.running')
      timeChanged = (new Date()) - @get('activityTrackerService.startTime')
      timeChangedInHours = timeChanged - (timeChanged % 3600000)
      hours = timeChangedInHours / 3600000
      timeChanged = timeChanged - (hours * 3600000)
      timeChangedInMinutes = timeChanged - (timeChanged % 60000)
      minutes = timeChangedInMinutes/60000
      timeChanged = timeChanged - (minutes * 60000)
      timeChanged = timeChanged - (timeChanged % 1000)
      seconds = timeChanged / 1000
      hours + " hours " + minutes + "  minutes " + seconds + " seconds"
    else
      ""

  calculateCurrentTimeRunLoop: ->
    runLoop = =>
      if(@get('activityTrackerService.running'))
        @set 'currentTime', @calculateCurrentTime()
        Ember.run.later(runLoop, 1000)
    Ember.run.later(runLoop, 1000)

  canStartActivity: ->
    true

  extraInformation: Ember.computed.alias 'activityTrackerService.extraInformation'

  actions:
    startActivity: ->
      if @canStartActivity()
        @set 'activityTrackerService.startTime', new Date()
        @set 'activityTrackerService.running', true
        @calculateCurrentTimeRunLoop()       

    stopActivity: ->
      if @get 'activityTrackerService.running'
        @set 'activityTrackerService.endTime', new Date()
        ats = @get 'activityTrackerService'
        @store.createRecord('activity', {
          description: @get 'activityTrackerService.description'
          startTime: @get 'activityTrackerService.startTime'
          endTime: @get 'activityTrackerService.endTime'
          extraInfo: @get 'activityTrackerService.extraInformation'
          username: @get 'settingsService.username'
        })
        ats.reset()
        @set 'currentTime', ""

    cancelActivity: ->
      ats = @get 'activityTrackerService'
      ats.reset()
      @set 'currentTime', ""
    
`export default IndexController`
