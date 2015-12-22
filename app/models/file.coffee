`import DS from 'ember-data'`

File = DS.Model.extend {
  filename: DS.attr('string'),
  rev: DS.attr('string')  
}

`export default File`
