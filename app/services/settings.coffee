`import Ember from 'ember'`

SettingsService = Ember.Service.extend

  username: 'user'

  activeColor: 'red-lighten-1'

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


`export default SettingsService`
