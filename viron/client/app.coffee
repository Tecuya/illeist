@viron = 
  # stores runtime objects
  runtime: {}
  start: ->
    viron.runtime.application = new viron.application
    viron.runtime.application.start()


class @viron.router extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'most_popular_relations'
    
  controller:
    most_popular_relations: ->
      viron.runtime.state.set topview: viron.views.MostPopular

    
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
      
      Backbone.history.start()


