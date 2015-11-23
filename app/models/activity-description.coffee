`import DS from 'ember-data'`

ActivityDescription = DS.Model.extend {
  description: DS.attr('string'),
  selected: DS.attr('boolean', { defaultValue: false }),
  username: DS.attr('string', {defaultValue: 'user'}),
  rev: DS.attr('string')
}

`export default ActivityDescription`
