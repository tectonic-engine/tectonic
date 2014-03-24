Tectonic = require '../../src/Tectonic'

describe 'Viewport', ->

  beforeEach ->
    @viewport = new Tectonic.Viewport

  describe 'render method', ->
    it 'should render the viewport', ->
      renderer =
        jasmine.createSpyObj 'renderer', ['render', 'setViewport', 'setScissor', 'enableScissorTest', 'setClearColor']
      window =
        renderer: renderer
        width: 1024
        height: 768

      @viewport.scene = {}
      @viewport.camera = {}
      @viewport.view =
        top: 0.1
        left: 0.2
        width: 0.6
        height: 0.5
      @viewport.colour = 0x0000FF

      @viewport.render window

      v1 = Math.floor 1024 * 0.2
      v2 = Math.floor 768 * 0.1
      v3 = Math.floor 1024 * 0.6
      v4 = Math.floor 768 * 0.5

      expect(renderer.setViewport).toHaveBeenCalledWith v1, v2, v3, v4
      expect(renderer.setScissor).toHaveBeenCalledWith v1, v2, v3, v4
      expect(renderer.enableScissorTest).toHaveBeenCalledWith true
      expect(renderer.setClearColor).toHaveBeenCalledWith @viewport.colour
      expect(renderer.render).toHaveBeenCalledWith @viewport.scene, @viewport.camera
