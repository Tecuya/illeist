@viron.views = {}


class @viron.views.Main extends Backbone.Marionette.Layout
  template: '#tpl_main'

  regions:
    page: '.page'
    
  constructor: ->    
    super()
    # todo recycle views
    @subview = null
    viron.runtime.state.on 'change:topview', =>
      @subview = new viron.runtime.state.attributes.topview
      @page.show @subview

          
class @viron.views.ContentComposite extends Backbone.Marionette.CompositeView
  tagName: 'section'
  className: 'content'
  
  template: '#tpl_contentcomposite'
  itemViewContainer: '.children'

  onRender: ->
    if @model.attributes.id
      @$el.find("[data-contentid=#{@model.attributes.id}]").click => @load_nearby()

  initialize: ->
    # if initialized with a children attribute, treat it like a
    # collection; this way we can hand a full deep tree of data to
    # CompositeContent and it handles it, creating collections &
    # sub-content views
    if @model.attributes.children
      @collection = new viron.collections.Content @model.attributes.children
      
  load_nearby: (evt) ->
    $.ajax
      url: '/api/nearby/' + @model.attributes.id,
      dataType: 'json',
      type: 'GET',
      success: (data) =>        
        @collection = new viron.collections.Content data
        @render()
        
                             
class @viron.views.NewestContent extends Backbone.Marionette.Layout
  template: '#tpl_newestcontent'

  regions:
    contentarea: '.newestcontent'
  
  onRender: ->
    @cl = new viron.collections.Content
    
    @cv = new viron.views.ContentComposite
      collection: @cl,
      model: ( new Backbone.Model title: 'Newest Content', id: null )
      
    @cl.fetch()
    @contentarea.show @cv


class @viron.views.Content extends Backbone.Marionette.ItemView
  template: '#tpl_content'

  