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
      @page.show viron.runtime.state.attributes.topview 


class @viron.views.ContentComposite extends Backbone.Marionette.CompositeView
  tagName: 'section'
  className: 'content'

  template: '#tpl_contentcomposite'
  itemViewContainer: '.children'

  ui:
    title: 'h2.title'
    children: '.children'

  initialize: ->
    # if initialized with a children attribute, treat it like a
    # collection; this way we can hand a full deep tree of data to
    # CompositeContent and it handles it, creating collections &
    # sub-content views
    if @model.attributes.children
      @collection = new viron.collections.Content @model.attributes.children

    # view states
    # 0 - havent loaded nearby
    # 1 - scheduled a nearby load
    # 2 - have already loaded nearby
    @state = 0

  onRender: ->
    @ui.title.click =>
      if @state == 0
        @load_nearby()

      else if @state == 2
        @ui.children.toggleClass('hidden')

  load_nearby: (evt) ->
    @state = 1
    $.ajax
      url: '/api/nearby/' + @model.attributes.id,
      dataType: 'json',
      type: 'GET',
      success: (data) =>
        @collection = new viron.collections.Content data
        @render()
        @state = 2


class @viron.views.EmptyList extends Backbone.Marionette.ItemView
  template: '#tpl_emptylist'


class @viron.views.ContentItem extends Backbone.Marionette.ItemView
  tagName: 'section'
  className: 'content'
  
  template: '#tpl_content'

  ui:
    title: 'h2.title'

  onRender: ->
    @ui.title.click =>
      viron.runtime.router.nav 'content', @model.id


class @viron.views.NewestContent extends Backbone.Marionette.CollectionView

  itemView: viron.views.ContentItem
  emptyView: viron.views.EmptyList

  initialize: ->
    @collection = new viron.collections.Content
    @collection.fetch()
  
