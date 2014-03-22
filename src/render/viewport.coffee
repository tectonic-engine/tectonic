class Viewport
  render: (window) ->
    if !@scene? or !@camera? then return

    top = Math.floor window.height * @view.top
    left = Math.floor window.width * @view.left
    width = Math.floor window.width * @view.width
    height = Math.floor window.height * @view.height

    window.renderer.setViewport left, top, width, height
    window.renderer.setScissor left, top, width, height
    window.renderer.enableScissorTest true

    window.renderer.setClearColor @colour

    window.renderer.render @scene, @camera

module.exports = Viewport
