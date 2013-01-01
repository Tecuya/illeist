
describe 'viron.start()', ->

  before ->
    viron.application_real = viron.application
    viron.application = class MockApp
      start: sinon.spy()
    viron.start()
    
  after ->
    viron.application = viron.application_real

  it 'should instantiate viron.application to viron.runtime.application', ->
    (viron.runtime.application instanceof viron.application).should.be.true

  it 'should viron.runtime.application.start()', ->
    viron.runtime.application.start.should.have.been.called



describe 'viron.application', ->

  app = null
    
  describe 'instantiation', ->

    before ->
      app = new viron.application

    it 'should set up viron.runtime.router', ->
      ( viron.runtime.router instanceof viron.router ).should.be.true

    it 'should set up viron.runtime.state', ->
      ( viron.runtime.state instanceof viron.models.State ).should.be.true

  describe 'start()', ->
    
    before ->
      sinon.spy Backbone.history, 'start'

      viron.views.Main_real = viron.views.Main
      viron.views.Main = Backbone.Marionette.Layout
      viron.views.Main.prototype.render = sinon.spy()
      
      app.start()

    after ->
      Backbone.history.start.restore()
      viron.views.Main = viron.views.Main_real

    it 'should define content region', ->
      app.content.should.not.be.undefined

    it 'should Backbone.history.start()', ->
      Backbone.history.start.should.have.been.called

      
