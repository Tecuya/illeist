describe 'app', ->

  it 'should instantiate cleanly', ->
    app = new viron.application

    describe 'when started', ->
      app.start()

      it 'should define content region', ->        
        app.should.not.be.undefined
