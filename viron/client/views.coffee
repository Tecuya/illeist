@viron.views = {}

class @viron.views.Main extends Backbone.Marionette.Layout
  template: '#tpl-main'

  regions:
    contentlist: '.contentlist'
    
  constructor: ->    
    super()
    console.log "bind"
    viron.state.on 'change:topview', =>
      console.log "caught change"
      @contentlist.show new viron.state.attributes.topview

class @viron.views.MostPopular extends Backbone.Marionette.Layout
  template: '#tpl-mostpopular'

class @viron.views.Content extends Backbone.Marionette.ItemView
  