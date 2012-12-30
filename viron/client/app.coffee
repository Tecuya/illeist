@viron = {}

class @viron.router extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'most_popular_relations'
    
  controller:
    most_popular_relations: ->
      viron.state.set topview: viron.views.MostPopular
        
    
class @viron.application extends Backbone.Marionette.Application
  constructor: ->
    super()
    @addInitializer (options) ->
      @addRegions
        content: '#wrap .viron'

      # store router & state objects in the global NS for easy access
      @router = new viron.router
      viron.state = new viron.models.State

      @content.show new viron.views.Main
      
      Backbone.history.start()


