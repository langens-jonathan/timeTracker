`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend

  settingsService: Ember.inject.service('settings')

  activeColor: Ember.computed.alias('settingsService.activeColor')

  init: ->
    cookie = document.cookie
    user = cookie.substring(0,cookie.indexOf('|'))
    color = cookie.substring(cookie.indexOf('|') + 1, cookie.length)
    ss = @get('settingsService')
    ss.set 'username', user
    ss.set 'activeColor', color


`export default ApplicationController`
