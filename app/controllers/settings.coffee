`import Ember from 'ember'`

SettingsController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'


  activeColor: Ember.computed.alias('settingsService.activeColor')

  colorOptions: Ember.computed.oneWay('settingsService.colorOptions')

  username: Ember.computed.alias('settingsService.username')

  actions:
    saveInfo: ->
      document.cookie = @get('username') + "|" + @get('activeColor')


`export default SettingsController`
