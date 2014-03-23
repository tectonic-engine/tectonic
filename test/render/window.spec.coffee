Tectonic = require '../../src/Tectonic'

describe 'Window', ->

  beforeEach ->
    @window = new Tectonic.Window

  describe 'render method', ->
    it 'should render each viewport', ->
      viewport1 = createSpyObj 'viewport1', ['render']
      viewport2 = createSpyObj 'viewport2', ['render']
      @window.renderer = {}

      @window.viewports.push viewport1
      @window.viewports.push viewport2

      @window.render()

      expect(viewport1.render).toHaveBeenCalledWith @window
      expect(viewport2.render).toHaveBeenCalledWith @window

  describe 'startRendering method', ->
    it 'should start the render loop', ->
      @window.render = createSpy 'render'
      expect(@window.isRendering).toBe false

      @window.startRendering()

      expect(@window.isRendering).toBe true
      expect(@window.render).toHaveBeenCalled()

  describe 'stopRendering method', ->
    it 'should stop the render loop', ->
      @window.isRendering = true

      @window.stopRendering()

      expect(@window.isRendering).toBe false
