Tectonic = require '../src/Tectonic'

describe 'Game', ->

  beforeEach ->
    @game = new Tectonic.Game

  describe 'run method', ->
    it 'should start the render loop', ->
      @game.render = createSpy 'render'
      @game.run()
      
      expect(@game.render).toHaveBeenCalled()
