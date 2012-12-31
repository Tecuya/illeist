@viron.views = {}


class @viron.views.Main extends Backbone.Marionette.Layout
  template: '#tpl_main'

  regions:
    page: '.page'
    
  constructor: ->    
    super()
    @subview = null
    viron.runtime.state.on 'change:topview', =>
      @subview = new viron.runtime.state.attributes.topview
      @page.show @subview


class @viron.views.MostPopular extends Backbone.Marionette.Layout
  template: '#tpl_mostpopular'

  regions:
    content_list: '.content_list'
    
  initialize: ->
    @cl or= new viron.collections.ContentList
    # @cl.on 'add', @add_content, @
    @cl.on 'reset', (args...) => ( @add_content(x) for x in args )
    @cl.fetch()

  add_content: (item) ->
    console.log "Add content"
    vc = new viron.views.Content model: item
    @content_list.el.append( vc.el )
    

class @viron.views.Content extends Backbone.Marionette.ItemView
  template: '#tpl_content'