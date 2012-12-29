describe 'app', ->
  
  app = new viron.application

  it 'should instantiate cleanly', ->
    app.should.not.be.undefined
    
  describe 'when started', ->
    app.start()
  
    it 'should define content region', ->
      app.content.should.not.be.undefined

    
   
