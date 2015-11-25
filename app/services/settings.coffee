`import Ember from 'ember'`

SettingsService = Ember.Service.extend
  init: ->
    @_super(arguments...)

  username: 'user'

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
    allSettings = @store.findAll('settings')
    settingsRecord = undefined
    allSettings.forEach (item, i) ->
      if item.username == @get('username')
        settingsRecord = settingsRecord or item

    unless settingsRecord
      settingsRecord = @store.createRecord('settings', {
        'activeColor': @get('activeColor')
        'username': @get('username')
      })
      settingsRecord.save()

    settingsRecord

  loadActiveColor: ->
    sr = @getSettingsRecord()
    @set 'activeColor', sr.get('activeColor')

  saveSettings: ->
    sr = @getSettingsRecord()
    sr.set 'activeColor', @get('activeColor')
    sr.set 'username', @get('username')
    sr.save()


`export default SettingsService`
