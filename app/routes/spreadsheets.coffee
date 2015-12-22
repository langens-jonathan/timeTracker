`import Ember from 'ember'`

SpreadsheetsRoute = Ember.Route.extend

  settingsService: Ember.inject.service('settings')

  model: ->
    rec = @store.createRecord('file', {
      filename: "currentMonth.xls"
    })
    #rec.save()
    ss = @get 'settingsService'
    m = @store.findAll('file').then( (records) =>
      model = Ember.A()
      records.forEach (item, i) =>
        filename = Ember.get(item, "filename")    
        if filename.indexOf(ss.get('username')) > -1
          filename = filename.substr(filename.indexOf('.') + 1, filename.length)
          file =
            filename: filename
            link: Ember.get(item, "filename")
          model.push file
      model
      )
    m      

`export default SpreadsheetsRoute`
