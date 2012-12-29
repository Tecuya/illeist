@viron = {}


class @viron.application extends Backbone.Marionette.Application
  constructor: ->
    super()
    @addInitializer (options) ->
      @addRegions
        content: '#wrap'

    
    
