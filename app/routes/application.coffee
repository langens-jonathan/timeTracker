`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend

  actions:
    willTransition: (transition) ->
      if(transition.targetName == "index")
        ic = @container.lookup("controller:index")
        ic.setActivityDescriptions()
      ss = @container.lookup("service:settings")
      ss.saveSettings()



`export default ApplicationRoute`
