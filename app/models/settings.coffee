`import DS from 'ember-data'`

Settings = DS.Model.extend {
  activeColor: DS.attr('string'),
  username: DS.atrr('string'),
  rev: DS.atrr('string')
}

`export default Settings`
