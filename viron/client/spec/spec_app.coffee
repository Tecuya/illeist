describe 'viron.application', ->
  
  app = new viron.application

  it 'should instantiate cleanly', ->
    app.should.not.be.undefined
    
  describe 'start', ->
    app.start()
  
    it 'should define content region', ->
      app.content.should.not.be.undefined

    it 'should set up the app router', ->
      ( app.router instanceof viron.router ).should.be.true

      
   
