describe 'viron.views.Main', ->

  # rig up a fake state full of spies and fake things
  viron.state = new Backbone.Model    
  sinon.spy viron.state, 'on'
  viron.state.attributes.topview = Backbone.Marionette.Layout

  # simply keeps the render() call from blowing up (since there is no template)
  viron.state.attributes.topview.prototype.render = sinon.spy()

  # System Under Test
  view = new viron.views.Main

  it 'should instantiate cleanly', ->
    view.should.not.be.undefined

  it 'should bind to viron.state change:topview', ->
    viron.state.on.should.have.been.calledWithMatch 'change:topview'

  describe 'when the viron.state change:topview callback is fired', ->

    # spy on page region's show
    sinon.spy view.page, 'show'
    
    viron.state.on.firstCall.args[1]()

    it 'should have instantiated class in state.attributes.topview to viron.views.Main.subview', ->
      ( view.subview instanceof viron.state.attributes.topview ).should.be.true

    it 'should page.show() the subview', ->
      view.page.show.should.have.been.calledWith view.subview


describe 'viron.views.MostPopular', ->

  view = new viron.views.MostPopular

  it 'should instantiate cleanly', ->
    view.should.not.be.undefined
    

  
