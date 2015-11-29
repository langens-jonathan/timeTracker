`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend

  actions:
    willTransition: (transition) ->
      if(transition.targetName == "index")
        ic = @container.lookup("controller:index")
        ic.setActivityDescriptions()


`export default ApplicationRoute`
