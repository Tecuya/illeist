@viron.views = {}


class @viron.views.Main extends Backbone.Marionette.Layout
  template: '#tpl-main'

  regions:
    page: '.page'
    
  constructor: ->    
    super()
    @subview = null
    viron.state.on 'change:topview', =>
      @subview = new viron.state.attributes.topview      
      @page.show @subview


class @viron.views.MostPopular extends Backbone.Marionette.Layout
  template: '#tpl-mostpopular'


class @viron.views.Content extends Backbone.Marionette.ItemView
  