`import Ember from 'ember'`

HistoryNewController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  activityTrackerService: Ember.inject.service('activity-tracker')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

  activityDescription: ""

  startTime: 0

  endTime: 0

  endTimeMinimum: 0

  startTimeString: "00:00"

  endTimeString: "00:00"

  dateValue: new Date()

  calculateStartTime: ->
    st = @get 'startTime'
    minutes = (st % 4)
    hours = st - minutes
    minutes = minutes * 15
    hours = hours/4
    startTime = new Date(@get('dateValue'))
    startTime.setHours(hours)
    startTime.setMinutes(minutes)
    startTime

  calculateEndTime: ->
    st = @get 'endTime'
    minutes = (st % 4)
    hours = st - minutes
    minutes = minutes * 15
    hours = hours/4
    endTime = new Date(@get('dateValue'))
    endTime.setHours(hours)
    endTime.setMinutes(minutes)
    endTime

  startTimeObserver: ( ->
    ###
    st = @get 'startTime'
    startTimeMinutes = (st % 4)
    st = st - startTimeMinutes
    startTimeMinutes = startTimeMinutes * 15
    st = st/4
    sts = ""
    stp = ""
    if st < 10
      sts = "0"
    if startTimeMinutes < 10
      stp = "0"
    @set 'startTimeString', sts + st + ":" + stp + startTimeMinutes
    if @get('endTime') < @get('startTime')
      @set 'endTime', @get('startTime')
    ###
  ).observes('startTime')

  endTimeObserver: ( ->
    ###
    st = @get 'endTime'
    startTimeMinutes = (st % 4)
    st = st - startTimeMinutes
    startTimeMinutes = startTimeMinutes * 15
    st = st/4
    sts = ""
    stp = ""
    if st < 10
      sts = "0"
    if startTimeMinutes < 10
      stp = "0"
    @set 'endTimeString', sts + st + ":" + stp + startTimeMinutes
    if @get('endTime') < @get('startTime')
      @set('endTime', @get('startTime'))
    ###
  ).observes('endTime')

  extraInformation: ""

  actions:
    createActivity: ->
      record = @store.createRecord('activity', {
        description: @get 'activityDescription'
        startTime: @calculateStartTime()
        endTime: @calculateEndTime()
        username: @get 'settingsService.username'
        extraInfo: @get 'extraInformation'
      })
      record.save()
      @set 'startTime', 0
      @set 'endTime', 0
      @set 'activityDescription', ''
      @set 'extraInformation', ''
      @set 'dateValue', new Date()
      @transitionTo('history')

`export default HistoryNewController`
