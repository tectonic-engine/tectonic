Window = require './render/window'

class Game
  constructor: (options) ->
    @window = new Window if options.render

  run: ->
    @render()

  render: ->


module.exports = Game
