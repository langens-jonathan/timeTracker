`import Ember from 'ember'`

ActivitiesNewController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  activityDescription: ""

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    'btn-large ' + @get('settingsService.activeColor') + ' darken -1 white-text'

  actions:

    create: ->
      record = @store.createRecord('activity-description', {
        description: @get 'activityDescription'
        username: @get 'settingsService.username'
      })
      record.save()
      @set 'activityDescription', ""
      @transitionTo('activities')

    cancel: ->
      @transitionTo('activities')


`export default ActivitiesNewController`
