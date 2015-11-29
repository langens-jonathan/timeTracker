`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend

  init: ->
    ss = @container.lookup("service:settings")
    sr = @getSettingsRecord()
    if sr
      ss.set 'activeColor'
      ss.set 'username'

  getSettingsRecord: ->
    settings = @store.findAll('setting')
    model = undefined
    settings.forEach (item, it) ->
      model = item

    unless model
      settings = @store.peekAll('setting')
      settings.forEach (item, i) ->
        model = model or item
    model

  settingsService: Ember.inject.service('settings')

  activeColor: Ember.computed.alias('settingsService.activeColor')


`export default ApplicationController`
