@viron = 
  # stores runtime objects
  runtime: {}
  start: ->
    viron.runtime.application = new viron.application
    viron.runtime.application.start()


class @viron.router extends Backbone.Router

  # single place to name routes, provide their BB router url, provide
  # a callable to produce the route url, and provide the handler for
  # how to execute the route
  myroutes: 
    newest_content:
      router_url: '',
      generate_url: -> ''
      handler: ->
        viron.runtime.state.set topview: new viron.views.NewestContent,

    content:
      router_url: 'content/:content_id',
      generate_url: (content_id) -> '/content/' + content_id
      handler: (content_id) ->
        fm = new viron.models.Content id: content_id
        
        fm.on 'change', ->
          view = new viron.views.ContentComposite model: fm
          
          # when loading a specific content item in topview,
          # load_nearby happens automatically
          view.load_nearby()

          # now set it in state 
          viron.runtime.state.set topview: view
          
        fm.fetch()
  
  constructor: (args...) ->
    # populate the @routes for Backbone.Router, then register
    # the named handlers so Backbone.Router can find them
    @routes = {}
    for name,def of @myroutes
      @routes[ def.router_url ] = name
      @[ name ] = def.handler
      
    # now that we've rigged up the object to have the @routes and
    # handlers defined, let the router constructor run
    super(args...)
      
  nav: (routename, args...) ->
    # find the route definition
    routeobj = @myroutes[ routename ]
    
    # i think we should be able to use {trigger: true} arg here to
    # make it fire the handler, but its not working, i think this is a
    # marionette bug? so i fire the handler myself
    @navigate routeobj.generate_url(args...)
    
    routeobj.handler(args...)
  
    
class @viron.application extends Backbone.Marionette.Application
  constructor: ->
    super()

    # store router & state objects in the global NS for easy access
    viron.runtime.router = new viron.router
    viron.runtime.state = new viron.models.State
        
    # define the stuff that will be called on start()
    @addInitializer (options) ->
      
      @addRegions content: '#wrap .viron'

      @content.show new viron.views.Main
      
      console.log "history start returns ", ( Backbone.history.start pushState: true )
      


