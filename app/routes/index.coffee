`import Ember from 'ember'`

IndexRoute = Ember.Route.extend

  init: ->
    @_super(arguments...)
    
    ad = @store.peekAll('activity-description')
    #@set 'activityDescriptions', ad

  activityDescriptions: []
    

`export default IndexRoute`
