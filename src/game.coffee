Window = require './render/window'

class Game
  constructor: (options) ->
    @window = new Window if options.render

  run: ->
    @window?.startRendering()


module.exports = Game
