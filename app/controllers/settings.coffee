`import Ember from 'ember'`

SettingsController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  buttonClass: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' darken-1 white-text'

  getSettingsRecord: ->
    allSettings = @store.findAll('setting')
    settingsRecord = undefined
    allSettings.forEach (item, i) ->
      settingsRecord = settingsRecord or item
    settingsRecord

  activeColor: Ember.computed.alias('settingsService.activeColor')

  colorOptions: Ember.computed.oneWay('settingsService.colorOptions')

  username: Ember.computed.alias('settingsService.username')

  actions:
    saveSettings: ->
      record = @store.createRecord('setting', {
        activeColor:  @get('settingsService.activeColor')
        username: @get('settingsService.username')
      })
      record.save()


`export default SettingsController`
