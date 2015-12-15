`import Ember from 'ember'`

HistoryRoute = Ember.Route.extend

  settingsService: Ember.inject.service('settings')

  model: ->    
    timeSpentString = (start, end) ->
      timeChanged = end - start
      timeChangedInHours = timeChanged - (timeChanged % 3600000)
      hours = timeChangedInHours / 3600000
      timeChanged = timeChanged - (hours * 3600000)
      timeChangedInMinutes = timeChanged - (timeChanged % 60000)
      minutes = timeChangedInMinutes/60000
      timeChanged = timeChanged - (minutes * 60000)
      timeChanged = timeChanged - (timeChanged % 1000)
      seconds = timeChanged / 1000
      hours + " hours " + minutes + "  minutes " + seconds + " seconds"
    
    m = @store.findAll('activity').then( (records) =>
      ss = @get('settingsService')
      model = Ember.A()
      records.forEach (item, i) ->
        item.set 'timeSpent', timeSpentString(item.get('startTime'), item.get('endTime'))
        if Ember.get(item, 'username') == ss.get('username')
          model.push item
      model
      )
    m

  content: Ember.computed.alias 'model'

  udpateModel: ->
    @set 'model', @store.findAll('activity')

  
`export default HistoryRoute`
