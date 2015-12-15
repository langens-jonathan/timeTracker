`import Ember from 'ember'`

SettingsService = Ember.Service.extend

  username: 'user'

  activeColor: 'amber'

  colorOptions: ['pink',
	        'teal',
		'red',
		'orange',
		'amber',
		'yellow',
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
