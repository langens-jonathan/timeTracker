`import Ember from 'ember'`

ActivityTrackerService = Ember.Service.extend

  running: false

  description:""

  startTime: undefined

  endTime: undefined

  extraInformation: ""

  reset: ->
    @set 'running', false
    @set 'description', ""
    @set 'startTime', undefined
    @set 'endTime', undefined


`export default ActivityTrackerService`
