Tectonic = require '../../'

game = new Tectonic.Game render: true
viewport = new Tectonic.Viewport

game.window.renderer = {}

game.window.viewports.push viewport

game.run()
