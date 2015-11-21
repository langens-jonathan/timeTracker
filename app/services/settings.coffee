`import Ember from 'ember'`

SettingsService = Ember.Service.extend
  init: ->
    @_super(arguments...)

  activeColor: 'deep-purple'

  colorOptions: ['pink',
	  'teal accent-3',
		'red lighten-1',
		'red',
		'orange',
		'amber',
		'yellow-accent-2',
		'light-green',
		'green',
		'cyan',
		'blue',
		'indigo',
		'purple',
		'deep-purple',
		'brown',
		'grey',
		'blue-grey']

  getSettingsRecord: ->
    allSettings = @store.peekAll('settings')
    settingsRecord = undefined
    allSettings.forEach (item, i) ->
      settingsRecord = settingsRecord or item

    unless settingsRecord
      settingsRecord = @store.createRecord('settings', {
        'activeColor': @activeColor
      })

    settingsRecord

  loadActiveColor: ->
    sr = @getSettingsRecord()
    @set 'activeColor', sr.get('activeColor')

  saveSettings: ->
    sr = @getSettingsRecord()
    sr.set 'activeColor', @activeColor


`export default SettingsService`
