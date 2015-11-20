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

  loadActiveColor:( ->
    sr = @store.findRecord('settings')
    @set 'activeColor', sr.activeColor
  )

  activeColorTracker: Ember.computed 'activeColor', ->
    settingsPost = @store.createRecord 'settings',
      'activeColor': @activeColor
    settingsPost.save()


`export default SettingsService`
