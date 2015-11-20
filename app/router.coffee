`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType


Router.map ->
  @route 'activities'
  @route 'settings'
  @route 'history'

`export default Router`
