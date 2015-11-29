`import DS from 'ember-data'`

Setting = DS.Model.extend {
  activeColor: DS.attr('string'),
  username: DS.attr('string'),
  rev: DS.attr('string')
}

`export default Setting`
