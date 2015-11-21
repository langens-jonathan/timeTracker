`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  activeColor: Ember.computed.alias('settingsService.activeColor')


`export default ApplicationController`
