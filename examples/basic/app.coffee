Tectonic = require '../../'
Three = require 'three'

game = new Tectonic.Game render: true
viewport = new Tectonic.Viewport
viewport2 = new Tectonic.Viewport

scene = new Three.Scene
camera = new Three.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 0.1, 1000

viewport.scene = scene
viewport.camera = camera
viewport.colour = 0x0000FF
viewport.view =
  top: 0
  left: 0
  width: 1
  height: 1
game.window.viewports.push viewport

viewport2.scene = scene
viewport2.camera = camera
viewport2.colour = 0xFF0000
viewport2.view =
  top: 0.70
  left: 0.70
  width: 0.25
  height: 0.25
game.window.viewports.push viewport2

game.window.renderer = new Three.WebGLRenderer
game.window.width = window.innerWidth
game.window.height = window.innerHeight

game.window.renderer.setSize window.innerWidth, window.innerHeight
document.body.appendChild game.window.renderer.domElement

game.run()

geometry = new Three.CubeGeometry 1, 1, 1
material = new Three.MeshBasicMaterial color: 0x00ff00
cube = new Three.Mesh geometry, material
viewport.scene.add cube

viewport.camera.position.z = 5
