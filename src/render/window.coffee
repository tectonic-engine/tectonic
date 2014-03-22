class Window
  viewports: []

  render: ->
    viewport.render(this) for viewport in @viewports if @renderer?

module.exports = Window
