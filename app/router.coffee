`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType


Router.map ->
  @route 'activities'
  @route 'settings'
  @route 'history'
  @route 'activities/new'
  @route 'history/new'
  @route 'history/edit'
  @route 'spreadsheets'

`export default Router`
