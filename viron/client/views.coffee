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


class @viron.views.Content extends Backbone.Marionette.ItemView
  template: '#tpl_content'


class @viron.views.ContentComposite extends Backbone.Marionette.CompositeView
  template: '#tpl_contentcomposite'
  itemViewContainer: '.itemview'
  itemView: viron.views.Content
  
    
class @viron.views.MostPopular extends Backbone.Marionette.Layout
  template: '#tpl_mostpopular'

  regions:
    most: '.mostpopular'
    
  onRender: ->
    fm = new Backbone.Model title: 'Most Popular Items'
    @cl = new viron.collections.Content
    @cv = new viron.views.ContentComposite collection: @cl, model: fm
    @cl.fetch()
    @most.show @cv
      
    # @cl or= new viron.collections.ContentList
    # # @cl.on 'add', @add_content, @
    # @cl.on 'reset', (args...) => ( @add_content(x) for x in args )
    # @cl.fetch()

  add_content: (item) ->
    console.log "Add content"
#    vc = new viron.views.Content model: item
  


class @viron.views.Content extends Backbone.Marionette.ItemView
  template: '#tpl_content'