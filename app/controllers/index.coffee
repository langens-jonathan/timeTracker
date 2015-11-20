`import Ember from 'ember'`

IndexController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  buttonColor: Ember.computed 'settingsService.activeColor', ->
    @get('settingsService.activeColor') + ' lighten-2 white-text'

`export default IndexController`
