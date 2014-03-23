class Window
  viewports: []
  isRendering: false

  constructor: ->
    @requestAnimationFrame = window.requestAnimationFrame if window?.requestAnimationFrame?

  render: =>
    viewport.render(this) for viewport in @viewports if @renderer?
    window.requestAnimationFrame?(@render) if @isRendering

  startRendering: ->
    @isRendering = true
    @render()

  stopRendering: ->
    @isRendering = false

module.exports = Window
