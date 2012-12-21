chai = require 'chai'
chai.should()

{Test} = require '../sut'

describe 'Sut instance', ->
  sut = new Test()
  it 'should have property set', ->
    sut.property.should.equal 'foo'