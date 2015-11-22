`import Ember from 'ember'`

HistoryRoute = Ember.Route.extend

  model: ->
    
    timeSpentString = (start, end) ->
      "0 hours 0 minutes 0 seconds"
    
    m = @store.peekAll('activity')
    m.forEach (item, i) ->
      item.set 'timeSpent', timeSpentString(item.get('startTime'), item.get('endTime'))
      item.set 'description', item.get('description')
      item.set 'startTime', item.get('startTime')

  content: Ember.computed.alias 'model'

  udpateModel: ->
    @set 'model', @store.peekAll('activity')

  
`export default HistoryRoute`
