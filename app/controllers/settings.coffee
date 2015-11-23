`import Ember from 'ember'`

SettingsController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  activeColor: Ember.computed.alias('settingsService.activeColor')

  colorOptions: Ember.computed.oneWay('settingsService.colorOptions')

  username: Ember.computed.alias('settingsService.username')


`export default SettingsController`
