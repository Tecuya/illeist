@viron.models = {}
  
class @viron.models.Content extends Backbone.Model
  doit: ->
    alert 'welcome'
    

class @viron.models.State extends Backbone.Model
  defaults:
    topview: null
