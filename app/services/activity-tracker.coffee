`import Ember from 'ember'`

ActivityTrackerService = Ember.Service.extend

  running: false

  description:""

  startTime: undefined

  endTime: undefined

  reset: ->
    @set 'running', false
    @set 'description', ""
    @set 'startTime', undefined
    @set 'endTime', undefined

  save: ->
    @store.createRecord('activity-description', {
      description: @get 'description',
      startTime: @get 'startTime',
      endtime:@get 'endtime'
    })
    @reset()

`export default ActivityTrackerService`
