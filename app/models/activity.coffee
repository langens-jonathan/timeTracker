`import DS from 'ember-data'`

Activity = DS.Model.extend {
  description: DS.attr('string'),
  startTime: DS.attr('date'),
  endTime: DS.attr('date'),
  extraInfo: DS.attr('string'),
  username: DS.attr('string')
}

`export default Activity`
