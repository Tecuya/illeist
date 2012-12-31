describe 'viron.views.Main', ->

  view = null
  
  before ->
    # rig up a fake state
    viron.runtime.state_real = viron.runtime.state
    viron.runtime.state = new class MockState extends Backbone.Model
      on: sinon.spy()
    
    # rig up a fake view for state's topview
    viron.runtime.state.attributes.topview = class MockView extends Backbone.Marionette.Layout
      render: sinon.spy()

    # instantiate view
    view = new viron.views.Main
    
  after ->
    viron.runtime.state = viron.runtime.state_real
    
  it 'should bind to viron.runtime.state change:topview', ->
    viron.runtime.state.on.should.have.been.calledWithMatch 'change:topview'

  describe 'when the viron.runtime.state change:topview callback is fired', ->

    before ->
      sinon.spy view.page, 'show'
      viron.runtime.state.on.firstCall.args[1]()
      
    after -> view.page.show.restore()

    it 'should have instantiated class in state.attributes.topview to viron.views.Main.subview', ->
      ( view.subview instanceof viron.runtime.state.attributes.topview ).should.be.true

    it 'should page.show() the subview', ->
      view.page.show.should.have.been.calledWith view.subview


# describe 'viron.views.MostPopular', ->

#   view = null
  
#   before ->
#     viron.collections.ContentList = new class MockCollection extends Backbone.Collection
#       on: sinon.spy()
#     view = new viron.views.MostPopular
      
#   it 'should', ->
#     view.on.should.have.been.calledWithMatch 'reset'

  
