Tectonic = require '../src/Tectonic'

describe 'Game', ->

  beforeEach ->
    @game = new Tectonic.Game render: true

  describe 'initialisation', ->
    it 'should create a default game window if rendering is enabled', ->
      @game = new Tectonic.Game render: true

      expect(@game.window instanceof Tectonic.Window).toBe true

    it 'should not create a default game window if rendering is disabled', ->
      @game = new Tectonic.Game render: false

      expect(@game.window).toBeUndefined()

  describe 'run method', ->
    it 'should start the render loop on the main window', ->
      @game.window = createSpyObj 'window', ['startRendering']
      @game.run()

      expect(@game.window.startRendering).toHaveBeenCalled()
